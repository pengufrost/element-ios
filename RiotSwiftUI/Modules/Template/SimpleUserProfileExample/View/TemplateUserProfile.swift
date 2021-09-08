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

import SwiftUI

@available(iOS 14.0, *)
struct TemplateUserProfile: View {

    // MARK: - Properties
    
    // MARK: Public
    
    @Environment(\.theme) var theme: ThemeSwiftUI
    @ObservedObject var viewModel: TemplateUserProfileViewModel
    
    var body: some View {
        VStack {
            TemplateUserProfileHeader(
                avatar: viewModel.viewState.avatar,
                displayName: viewModel.viewState.displayName,
                presence: viewModel.viewState.presence
            )
            Divider()
            VStack{
                HStack(alignment: .center){
                    Spacer()
                    Text("More great user content!")
                        .font(theme.fonts.title2)
                        .foregroundColor(theme.colors.secondaryContent)
                    Spacer()
                }
            }
            .frame(maxHeight: .infinity)
        }
        .frame(maxHeight: .infinity)
        .navigationTitle(viewModel.viewState.displayName ?? "")
        .navigationBarItems(leading: leftButton, trailing: rightButton)
    }
    
    // MARK: Private
    
    private var leftButton: some View {
        Button(VectorL10n.cancel) {
            viewModel.proccess(viewAction: .cancel)
        }
    }
    
    private var rightButton: some View {
        Button(VectorL10n.done) {
            viewModel.proccess(viewAction: .cancel)
        }
    }
}

// MARK: - Previews

@available(iOS 14.0, *)
struct TemplateUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        TemplateUserProfile(viewModel: TemplateUserProfileViewModel(userService: MockTemplateUserProfileService.example))
        .addDependency(MockAvatarService.example)
    }
}