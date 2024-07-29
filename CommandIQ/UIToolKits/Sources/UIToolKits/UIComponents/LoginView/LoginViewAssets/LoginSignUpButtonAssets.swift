//
//  LoginSignUpButtonAssets.swift
//  
//
//  Created by Murali moorthy on 7/24/24.
//

import SwiftUI

/// Protocol defining the assets for login and sign-up buttons, such as colors.
public protocol LoginSignUpButtonAssetsProtocol {
    /// The foreground color of the login button.
    var primaryForgroundColor: Color { get set }

    /// The background color of the login button.
    var primaryBackgroundColor: Color { get set }
    
    /// The border color of the sign-up button.
    var primaryBorderColor: Color { get set }

    /// The color of the heading text.
    var headingTextColor: Color { get set }

    /// The border color of the sign-up button.
    var secondayBorderColor: Color { get set }

    /// The foreground color of the sign-up button.
    var secondayForgroundColor: Color { get set }
    
    
}

/// Struct implementing the `LoginSignUpButtonAssets` protocol, providing default colors for login and sign-up buttons.
public struct LoginSignUpButtonAssets: LoginSignUpButtonAssetsProtocol {
    public var primaryBorderColor: Color
    
    /// The foreground color of the login button.
    public var primaryForgroundColor: Color

    /// The background color of the login button.
    public var primaryBackgroundColor: Color

    /// The color of the heading text.
    public var headingTextColor: Color

    /// The border color of the sign-up button.
    public var secondayBorderColor: Color

    /// The foreground color of the sign-up button.
    public var secondayForgroundColor: Color

    /// Initializes a new instance of `LoginSignUpButtonColors`.
    ///
    /// - Parameters:
    ///   - loginForgroundColor: The foreground color of the login button. Defaults to `appPrimaryColor`.
    ///   - loginBackgroundColor: The background color of the login button. Defaults to clear.
    ///   - headingTextColor: The color of the heading text. Defaults to white.
    ///   - signUpBorderColor: The border color of the sign-up button. Defaults to white.
    ///   - signUpForgroundColor: The foreground color of the sign-up button. Defaults to white.
    public init(primaryBorderColor: Color = .clear,
                primaryForgroundColor: Color = .appPrimaryColor,
                primaryBackgroundColor: Color = .clear,
                headingTextColor: Color = .white,
                secondayBorderColor: Color = .white,
                secondayForgroundColor: Color = .white) {
        self.primaryBorderColor = primaryBorderColor
        self.primaryForgroundColor = primaryForgroundColor
        self.primaryBackgroundColor = primaryBackgroundColor
        self.headingTextColor = headingTextColor
        self.secondayBorderColor = secondayBorderColor
        self.secondayForgroundColor = secondayForgroundColor
    }
}
