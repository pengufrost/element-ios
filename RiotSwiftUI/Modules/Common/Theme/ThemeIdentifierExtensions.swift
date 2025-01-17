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

import Foundation
import DesignKit

/**
 Extension to `ThemeIdentifier` for getting the SwiftUI theme.
 */
@available(iOS 14.0, *)
extension ThemeIdentifier {
    fileprivate static let defaultTheme = DefaultThemeSwiftUI()
    fileprivate static let darkTheme = DarkThemeSwiftUI()
    public var themeSwiftUI: ThemeSwiftUI {
        switch self {
        case .light:
            return Self.defaultTheme
        case .dark, .black:
            return Self.darkTheme
        }
    }
}
