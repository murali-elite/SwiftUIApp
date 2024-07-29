//
//  LoginContainerView.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/21/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A view that contains the login interface, including fields for email, password, and location,
/// as well as a popup for resetting the password.
public struct LoginContainerView: View {
    // MARK: - Constants

    private enum Constants {
        static let verticalSpace: CGFloat = 30
        static let locationFontSize: CGFloat = 15
    }

    // MARK: - Properties
    var assets: LoginContainerAssetsProtocol
    @Binding var email: String
    @Binding var password: String
    @Binding var location: String
    @Binding var isPasswordHidden: Bool
    @Binding var isPopupPresented: Bool
    var locations: [String]
    /// A closure that is called when a location is selected.
    public var handler: SelectedElementClouser

    /// The content and behavior of the `LoginContainerView`.
    public var body: some View {
        VStack(spacing: Constants.verticalSpace) {
            // Email Input field
            TextField("", text: $email)
                .textFieldViewModifier(title: LoginPageString.email.localized(),
                                       titleColor: assets.headingTextColor,
                                       tintColor: assets.tintColor)
            // Password Input field
            passwordContainerView()

            // Location Drop Down View
            if #available(iOS 15.0, *) {
                locationView()
                    .foregroundStyle(assets.headingTextColor)
            } else {
                locationView()
            }
        }
    }

    /// Creates an instance of `LoginContainerView`.
        ///
        /// - Parameters:
        ///   - email: A binding to the email address.
        ///   - password: A binding to the password.
        ///   - location: A binding to the selected location.
        ///   - isPasswordHidden: A binding to a Boolean indicating if the password is hidden.
        ///   - locations: An array of locations to be displayed in the dropdown.
        public init(email: Binding<String>,
                    password: Binding<String>,
                    location: Binding<String>,
                    isPasswordHidden: Binding<Bool>,
                    isPopupPresented: Binding<Bool>,
                    locations: [String],
                    assets: LoginContainerAssetsProtocol = LoginContainerAssets(),
                    handler: @escaping SelectedElementClouser) {
            self._email = email
            self._password = password
            self._location = location
            self._isPasswordHidden = isPasswordHidden
            self._isPopupPresented = isPopupPresented
            self.locations = locations
            self.assets = assets
            self.handler = handler
        }

    @ViewBuilder
    private func forgotPasswordView() -> some View {
        Text(LoginPageString.forgotPassword.localized())
            .underlined(assets.tintColor)
            .accessibility(addTraits: .isButton)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(assets.headingTextColor)
            .onTapGesture {
                isPopupPresented.toggle()
            }
    }

    @ViewBuilder
    private func passwordContainerView() -> some View {
        VStack {
            PasswordTextFieldView(title: LoginPageString.password.localized(),
                                  password: $password,
                                  titleColor: assets.headingTextColor,
                                  tintColor: assets.tintColor)

            if #available(iOS 15.0, *) {
                forgotPasswordView()
                    .accessibilityAddTraits(.isButton)
            } else {
                forgotPasswordView()
            }
        }
    }

    @ViewBuilder
    private func locationView() -> some View {
        Text(LoginPageString.location.localized())
            .foregroundColor(assets.headingTextColor)
            .font(.system(size: Constants.locationFontSize))
            .dropDownViewModifier(title: $location,
                                  elements: locations,
                                  textColor: assets.headingTextColor,
                                  tintColor: assets.tintColor,
                                  selectedElement: handler)
    }
}
