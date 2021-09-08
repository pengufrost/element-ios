// 
// Copyright 2021 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import XCTest
import Combine

@testable import Riot

@available(iOS 14.0, *)
class TemplateUserProfileViewModelTests: XCTestCase {
    var service: MockTemplateUserProfileService!
    var viewModel: TemplateUserProfileViewModel!
    var cancellables = Set<AnyCancellable>()
    override func setUpWithError() throws {
        service = MockTemplateUserProfileService()
        viewModel = TemplateUserProfileViewModel(userService: service)
    }
    
    func testInitialState() {
        XCTAssertEqual(viewModel.viewState.displayName, MockTemplateUserProfileService.example.displayName)
        XCTAssertEqual(viewModel.viewState.avatar?.mxContentUri, MockTemplateUserProfileService.example.avatarUrl)
        XCTAssertEqual(viewModel.viewState.presence, MockTemplateUserProfileService.initialPresenceState)
    }

    func testFirstPresenceRecieved() throws {
        let presencePublisher = viewModel.$viewState.map(\.presence).removeDuplicates().collect(1).first()
        XCTAssertEqual(try xcAwait(presencePublisher), [MockTemplateUserProfileService.initialPresenceState])
    }
    
    func testPresenceUpdatesRecieved() throws {
        let presencePublisher = viewModel.$viewState.map(\.presence).removeDuplicates().collect(3).first()
        let newPresenceValue1: TemplateUserProfilePresence = .online
        let newPresenceValue2: TemplateUserProfilePresence = .idle
        service.simulateUpdate(presence: newPresenceValue1)
        service.simulateUpdate(presence: newPresenceValue2)
        XCTAssertEqual(try xcAwait(presencePublisher), [MockTemplateUserProfileService.initialPresenceState, newPresenceValue1, newPresenceValue2])
    }
    
    
}