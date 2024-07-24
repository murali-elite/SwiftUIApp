//
//  LoginSignUpButtonAssets.swift
//  
//
//  Created by Murali moorthy on 7/24/24.
//

import SwiftUI

/// Protocol defining the assets for login and sign-up buttons, such as colors.
public protocol LoginSignUpButtonAssets {
    /// The foreground color of the login button.
    var loginForgroundColor: Color { get set }

    /// The background color of the login button.
    var loginBackgroundColor: Color { get set }

    /// The color of the heading text.
    var headingTextColor: Color { get set }

    /// The border color of the sign-up button.
    var signUpBorderColor: Color { get set }

    /// The foreground color of the sign-up button.
    var signUpForgroundColor: Color { get set }
}

/// Struct implementing the `LoginSignUpButtonAssets` protocol, providing default colors for login and sign-up buttons.
public struct LoginSignUpButtonColors: LoginSignUpButtonAssets {
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

    /// Initializes a new instance of `LoginSignUpButtonColors`.
    ///
    /// - Parameters:
    ///   - loginForgroundColor: The foreground color of the login button. Defaults to `appPrimaryColor`.
    ///   - loginBackgroundColor: The background color of the login button. Defaults to clear.
    ///   - headingTextColor: The color of the heading text. Defaults to white.
    ///   - signUpBorderColor: The border color of the sign-up button. Defaults to white.
    ///   - signUpForgroundColor: The foreground color of the sign-up button. Defaults to white.
    public init(loginForgroundColor: Color = .appPrimaryColor,
                loginBackgroundColor: Color = .clear,
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
