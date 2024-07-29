//
//  LoginSignUpButtonAssetsProtocol.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/24/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// Protocol defining the assets for login and sign-up buttons, such as colors.
public protocol LoginSignUpButtonAssetsProtocol {
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
