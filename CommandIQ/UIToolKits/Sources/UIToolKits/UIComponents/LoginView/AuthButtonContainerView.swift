//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/22/24.
//

import SwiftUI

public protocol AuthButtonViewAssetsProtocol {
    var primaryName: String { get set }
    var secondayName: String { get set }
    var secondayHeaderName: String { get set }
    var primaryForgroundColor: Color { get set }
    var secondayForgroundColor: Color { get set }
    var headingForgroundColor: Color { get set }
    var primaryBackgroundColor: Color { get set }
    var secondayBackgroundColor: Color { get set }
    var headerForgroundColor: Color { get set }
    var secondayBorderColor: Color { get set }
    var buttonFont: Font { get set }
    var headingFont: Font { get set }
}

public struct AuthButtonViewAssets: AuthButtonViewAssetsProtocol {
    public var secondayBorderColor: Color
    public var headerForgroundColor: Color
    public var primaryName: String
    public var secondayName: String
    public var secondayHeaderName: String
    public var primaryForgroundColor: Color
    public var secondayForgroundColor: Color
    public var headingForgroundColor: Color
    public var primaryBackgroundColor: Color
    public var secondayBackgroundColor: Color
    public var buttonFont: Font
    public var headingFont: Font

    public init(primaryName: String,
                secondayName: String,
                secondayHeaderName: String,
                primaryForgroundColor: Color = .blue,
                secondayForgroundColor: Color = .white,
                headingForgroundColor: Color = .white,
                primaryBackgroundColor: Color = .blue,
                secondayBackgroundColor: Color = .clear,
                headerForgroundColor: Color = .white,
                secondayBorderColor: Color = .white,
                buttonFont: Font = .system(size: 16, weight: .semibold),
                headingFont: Font = .system(size: 16, weight: .semibold)) {
        self.primaryName = primaryName
        self.secondayName = secondayName
        self.secondayHeaderName = secondayHeaderName
        self.primaryForgroundColor = primaryForgroundColor
        self.secondayForgroundColor = secondayForgroundColor
        self.headingForgroundColor = headingForgroundColor
        self.primaryBackgroundColor = primaryBackgroundColor
        self.secondayBackgroundColor = secondayBackgroundColor
        self.secondayBorderColor = secondayBorderColor
        self.buttonFont = buttonFont
        self.headingFont = headingFont
        self.headerForgroundColor = headerForgroundColor
    }
}

/// A view that provides login and sign-up buttons.
public struct AuthButtonContainerView: View {
    // MARK: - Constants
    private enum Constants {
        static var verticalSpacing: CGFloat = 20
    }

    // MARK: - Properties
    var assets: AuthButtonViewAssetsProtocol
    var primaryActionHandler: () -> Void
    var secondayActionHandler: () -> Void

    /// The body of the `LoginSignUpContainerView`, which displays login and sign-up buttons.
    public var body: some View {
        VStack(spacing: Constants.verticalSpacing) {
            // Display the login button with appropriate styling based on iOS version
            if #available(iOS 15.0, *) {
                loginButtonView()
                    .foregroundStyle(assets.primaryForgroundColor)
            } else {
                loginButtonView()
            }

            // Display the sign-up button
            SignUpButtonView(
                heading: LoginPageString.dontHaveALogIn.localized(),
                buttonText: LoginPageString.signIn.localized(),
                headingColor: assets.headerForgroundColor,
                buttonTextColor: assets.secondayForgroundColor,
                borderColor: assets.secondayBorderColor, action: secondayActionHandler
            )
        }
    }

    /// Creates an instance of `LoginSignUpContainerView`.
    public init(assets: AuthButtonViewAssetsProtocol,
                primaryActionHandler: @escaping () -> Void,
                secondayActionHandler: @escaping () -> Void) {
        self.assets = assets
        self.primaryActionHandler = primaryActionHandler
        self.secondayActionHandler = secondayActionHandler
    }

    /// A view that displays a login button with a specific appearance based on the iOS version.
    ///
    /// - Returns: A `Button` view configured to represent a login action.
    @ViewBuilder
    private func loginButtonView() -> some View {
        Button(LoginPageString.logIn.localized(), action: primaryActionHandler)
        .foregroundColor(assets.primaryForgroundColor)
        .buttonStyleViewModifier(backgroundColor: assets.primaryBackgroundColor)
    }
}
