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

protocol ShowSpaceExploreRoomViewModelViewDelegate: AnyObject {
    func showSpaceExploreRoomViewModel(_ viewModel: ShowSpaceExploreRoomViewModelType, didUpdateViewState viewSate: ShowSpaceExploreRoomViewState)
}

protocol ShowSpaceExploreRoomViewModelCoordinatorDelegate: AnyObject {
    func showSpaceExploreRoomViewModel(_ viewModel: ShowSpaceExploreRoomViewModelType, didSelect item: SpaceExploreRoomListItemViewData, from sourceView: UIView?)
    func showSpaceExploreRoomViewModelDidCancel(_ viewModel: ShowSpaceExploreRoomViewModelType)
}

/// Protocol describing the view model used by `ShowSpaceExploreRoomViewController`
protocol ShowSpaceExploreRoomViewModelType {        
        
    var viewDelegate: ShowSpaceExploreRoomViewModelViewDelegate? { get set }
    var coordinatorDelegate: ShowSpaceExploreRoomViewModelCoordinatorDelegate? { get set }
    
    func process(viewAction: ShowSpaceExploreRoomViewAction)
}