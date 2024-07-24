//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/22/24.
//

import SwiftUI

/// A view that provides login and sign-up buttons.
public struct LoginSignUpButtonContainerView: View {
    // MARK: - Constants
    private enum Constants {
        static var verticalSpacing: CGFloat = 20
    }

    // MARK: - Properties
    var assets: LoginSignUpButtonAssets

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
                borderColor: assets.signUpBorderColor
            )
        }
    }

    /// Creates an instance of `LoginSignUpContainerView`.
    public init(assets: LoginSignUpButtonAssets = LoginSignUpButtonColors()) {
        self.assets = assets
    }

    /// A view that displays a login button with a specific appearance based on the iOS version.
    ///
    /// - Returns: A `Button` view configured to represent a login action.
    @ViewBuilder
    private func loginButtonView() -> some View {
        Button(LoginPageString.logIn.localized()) {
            // Handle log in action
        }
        .foregroundColor(.blue)
        .buttonStyleViewModifier(backgroundColor: assets.loginBackgroundColor)
    }
}
