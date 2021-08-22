// File created from ScreenTemplate
// $ createScreen.sh Spaces/SpaceRoomList/ExploreRoom ShowSpaceExploreRoom
/*
 Copyright 2021 New Vector Ltd
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation
import UIKit

final class ShowSpaceExploreRoomCoordinator: ShowSpaceExploreRoomCoordinatorType {
    
    // MARK: - Properties
    
    // MARK: Private
    
    private let session: MXSession
    private let spaceId: String
    private var showSpaceExploreRoomViewModel: ShowSpaceExploreRoomViewModelType
    private let showSpaceExploreRoomViewController: ShowSpaceExploreRoomViewController
    
    // MARK: Public

    // Must be used only internally
    var childCoordinators: [Coordinator] = []
    
    weak var delegate: ShowSpaceExploreRoomCoordinatorDelegate?
    
    // MARK: - Setup
    
    init(session: MXSession, spaceId: String, spaceName: String?) {
        self.session = session
        self.spaceId = spaceId
        
        let showSpaceExploreRoomViewModel = ShowSpaceExploreRoomViewModel(session: self.session, spaceId: self.spaceId, spaceName: spaceName)
        let showSpaceExploreRoomViewController = ShowSpaceExploreRoomViewController.instantiate(with: showSpaceExploreRoomViewModel)
        self.showSpaceExploreRoomViewModel = showSpaceExploreRoomViewModel
        self.showSpaceExploreRoomViewController = showSpaceExploreRoomViewController
    }
    
    // MARK: - Public methods
    
    func start() {            
        self.showSpaceExploreRoomViewModel.coordinatorDelegate = self
    }
    
    func toPresentable() -> UIViewController {
        return self.showSpaceExploreRoomViewController
    }
}

// MARK: - ShowSpaceExploreRoomViewModelCoordinatorDelegate
extension ShowSpaceExploreRoomCoordinator: ShowSpaceExploreRoomViewModelCoordinatorDelegate {
    func showSpaceExploreRoomViewModel(_ viewModel: ShowSpaceExploreRoomViewModelType, didSelect item: SpaceExploreRoomListItemViewData, from sourceView: UIView?) {
        self.delegate?.showSpaceExploreRoomCoordinator(self, didSelect: item, from: sourceView)
    }
    
    func showSpaceExploreRoomViewModelDidCancel(_ viewModel: ShowSpaceExploreRoomViewModelType) {
        self.delegate?.showSpaceExploreRoomCoordinatorDidCancel(self)
    }
}