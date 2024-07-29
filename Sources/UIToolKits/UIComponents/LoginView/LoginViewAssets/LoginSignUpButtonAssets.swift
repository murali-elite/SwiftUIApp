//
//  LoginSignUpButtonAssets.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/24/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// Struct implementing the `LoginSignUpButtonAssetsProtocol` protocol,
/// providing default colors for login and sign-up buttons.
public struct LoginSignUpButtonAssets: LoginSignUpButtonAssetsProtocol {
    /// The foreground color of the login button.
    public var loginForgroundColor: Color

    /// The background color of the login button.
    public var loginBackgroundColor: Color

    /// The color of the heading text.
    public var headingTextColor: Color

    /// The border color of the sign-up button.
    public var signUpBorderColor: Color

    /// The foreground color of the sign-up button.
    public var signUpForgroundColor: Color

    /// Initializes a new instance of `LoginSignUpButtonAssets`.
    ///
    /// - Parameters:
    ///   - loginForgroundColor: The foreground color of the login button. Defaults to `appPrimaryColor`.
    ///   - loginBackgroundColor: The background color of the login button. Defaults to clear.
    ///   - headingTextColor: The color of the heading text. Defaults to white.
    ///   - signUpBorderColor: The border color of the sign-up button. Defaults to white.
    ///   - signUpForgroundColor: The foreground color of the sign-up button. Defaults to white.
    public init(loginForgroundColor: Color = .blue,
                loginBackgroundColor: Color = .white,
                headingTextColor: Color = .white,
                signUpBorderColor: Color = .white,
                signUpForgroundColor: Color = .white) {
        self.loginForgroundColor = loginForgroundColor
        self.loginBackgroundColor = loginBackgroundColor
        self.headingTextColor = headingTextColor
        self.signUpBorderColor = signUpBorderColor
        self.signUpForgroundColor = signUpForgroundColor
    }
}
