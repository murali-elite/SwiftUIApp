//
//  ResetPasswordContainerView.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/21/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A view for resetting the password, including fields for email and location.
public struct ResetPasswordContainerView: View {
    // MARK: - Constants

    private enum Constants {
        static let locationFontSize: CGFloat = 15
        static let spacing: CGFloat = 20
        static let padding: CGFloat = 20
        static let verticalPadding: CGFloat = 10
        static let descriptionFontSize: CGFloat = 17
        static let titleFontSize: CGFloat = 18
        static let colorOpacity: CGFloat = 0.6
    }

    // MARK: - Properties

    /// An object that provides assets used in the reset password view.
    public var assets: ResetPasswordAssetsProtocol

    /// A binding to the email address input by the user.
    @Binding public var email: String

    /// A binding to the location input by the user.
    @Binding public var location: String

    /// A list of location options to display in the dropdown.
    public var locations: [String]

    /// A closure that is called when a location is selected.
    public var handler: SelectedElementClouser
    var submitAction: () -> Void
    var cancelAction: () -> Void

    // MARK: - Body

    /// The content and behavior of the `ForgotPasswordPopUpView`.
    public var body: some View {
        VStack {
            VStack(spacing: Constants.verticalPadding) {
                Text(LoginResetPageString.resetPassword.localized())
                    .font(.system(size: Constants.titleFontSize))

                if #available(iOS 15.0, *) {
                    resetDescriptionText()
                        .foregroundStyle(.black.opacity(Constants.colorOpacity))
                } else {
                    resetDescriptionText()
                }
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .padding(.vertical)

            VStack(spacing: Constants.spacing) {
                TextField("", text: $email)
                    .textFieldViewModifier(title: LoginPageString.email.localized(),
                                           titleColor: assets.inputHeaderTextColor,
                                           tintColor: assets.bottomLineColor)

                Text(LoginPageString.location.localized())
                    .font(.system(size: Constants.locationFontSize))
                    .dropDownViewModifier(title: $location,
                                          elements: locations,
                                          textColor: assets.inputHeaderTextColor,
                                          tintColor: assets.bottomLineColor) { _, _ in
                        // Closure body
                    }
            }
            .padding(.bottom, Constants.padding)

            ResetActionsButtonView(submitAction: submitAction, cancelAction: cancelAction)
        }
        .padding()
    }

    // MARK: - Initializer

    /// Initializes a new instance of the `ResetPasswordContainerView`.
    ///
    /// - Parameters:
    ///   - email: A binding to the email address input by the user.
    ///   - location: A binding to the location input by the user.
    ///   - locations: A list of location options to display in the dropdown.
    ///   - assets: An object that provides assets used in the reset password view. Defaults to `ResetPasswordAssets()`.
    ///   - handler: A closure that is called when a location is selected.
    public init(email: Binding<String>,
                location: Binding<String>,
                locations: [String],
                assets: ResetPasswordAssetsProtocol = ResetPasswordAssets(),
                handler: @escaping SelectedElementClouser,
                submitAction: @escaping () -> Void,
                cancelAction: @escaping () -> Void) {
        self.assets = assets
        self._email = email
        self._location = location
        self.locations = locations
        self.handler = handler
        self.submitAction = submitAction
        self.cancelAction = cancelAction
    }

    // MARK: - Private Methods

    /// Creates the description text for the reset password view.
    ///
    /// - Returns: A view displaying the description text with styling.
    @ViewBuilder
    private func resetDescriptionText() -> some View {
        Text(LoginResetPageString.resetPasswordDescription.localized())
            .font(.system(size: Constants.descriptionFontSize))
            .foregroundColor(.black.opacity(Constants.colorOpacity))
    }
}
