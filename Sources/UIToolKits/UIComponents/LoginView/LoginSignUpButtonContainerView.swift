//  LoginSignUpButtonContainerView.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/21/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A view that provides login and sign-up buttons.
public struct LoginSignUpButtonContainerView: View {
    // MARK: - Constants
    private enum Constants {
        static var verticalSpacing: CGFloat = 20
    }

    // MARK: - Properties
    var assets: LoginSignUpButtonAssetsProtocol
    var primaryAction: () -> Void
    var secondayAction: () -> Void

    /// The body of the `LoginSignUpContainerView`, which displays login and sign-up buttons.
    public var body: some View {
        VStack(spacing: Constants.verticalSpacing) {
            // Display the login button with appropriate styling based on iOS version
            if #available(iOS 15.0, *) {
                loginButtonView()
                    .foregroundStyle(assets.loginForgroundColor)
            } else {
                loginButtonView()
            }

            // Display the sign-up button
            SignUpButtonView(
                heading: LoginPageString.dontHaveALogIn.localized(),
                buttonText: LoginPageString.signIn.localized(),
                headingColor: assets.headingTextColor,
                buttonTextColor: assets.signUpForgroundColor,
                borderColor: assets.signUpBorderColor,
                action: secondayAction
            )
        }
    }

    /// Creates an instance of `LoginSignUpContainerView`.
    public init(assets: LoginSignUpButtonAssetsProtocol = LoginSignUpButtonAssets(),
                primaryAction: @escaping () -> Void,
                secondayAction: @escaping () -> Void) {
        self.assets = assets
        self.primaryAction = primaryAction
        self.secondayAction = secondayAction
    }

    /// A view that displays a login button with a specific appearance based on the iOS version.
    ///
    /// - Returns: A `Button` view configured to represent a login action.
    @ViewBuilder
    private func loginButtonView() -> some View {
        Button(LoginPageString.logIn.localized()) {
            primaryAction()
        }
        .foregroundColor(assets.loginForgroundColor)
        .buttonStyleViewModifier(backgroundColor: assets.loginBackgroundColor)
    }
}

