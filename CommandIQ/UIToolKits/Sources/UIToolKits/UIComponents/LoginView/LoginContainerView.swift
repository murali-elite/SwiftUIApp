//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/22/24.
//

import SwiftUI

/// Protocol defining the assets for a login container, such as colors.
public protocol LoginContainerAssets {
    /// The color of the heading text.
    var headingTextColor: Color { get set }

    /// The color used for tints.
    var tinitColor: Color { get set }
}

/// Struct implementing the `LoginContainerAssets` protocol, providing default colors for a login container.
public struct LoginContainerColors: LoginContainerAssets {
    /// The color of the heading text.
    public var headingTextColor: Color

    /// The color used for tints.
    public var tinitColor: Color

    /// Initializes a new instance of `LoginContainerColors`.
    ///
    /// - Parameters:
    ///   - headingTextColor: The color of the heading text. Defaults to white.
    ///   - tinitColor: The color used for tints. Defaults to white.
    public init(headingTextColor: Color = .white,
                tinitColor: Color = .white) {
        self.headingTextColor = headingTextColor
        self.tinitColor = tinitColor
    }
}

/// A view that contains the login interface, including fields for email, password, and location,
/// as well as a popup for resetting the password.
public struct LoginContainerView: View {
    // MARK: - Constants

    private enum Constants {
        static let verticalSpace: CGFloat = 30
        static let locationFontSize: CGFloat = 15
    }

    // MARK: - Properties

    public var assets: LoginContainerAssets

    @Binding public var email: String
    @Binding public var password: String
    @Binding public var location: String
    @Binding public var isPasswordHidden: Bool
    @State private var isPopupPresented: Bool = false
    @State private var detentHeight: CGFloat = 0
    public var locations: [String]

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
                locations: [String],
                assets: LoginContainerAssets = LoginContainerColors()) {
        self._email = email
        self._password = password
        self._location = location
        self._isPasswordHidden = isPasswordHidden
        self.locations = locations
        self.assets = assets
    }

    @ViewBuilder
    private func locationText() -> some View {
        Text(LoginPageString.location.localized())
            .foregroundColor(assets.headingTextColor)
            .font(.system(size: Constants.locationFontSize))
            .dropDownViewModifier(title: $location, elements: locations) { _, _ in
            }
    }

    /// The content and behavior of the `LoginContainerView`.
    public var body: some View {
        VStack(spacing: Constants.verticalSpace) {
            TextField("", text: $email)
                .textFieldViewModifier(title: LoginPageString.email.localized(),
                                       titleColor: assets.headingTextColor,
                                       tintColor: assets.tinitColor)
            VStack {
                PasswordTextFieldView(title: LoginPageString.password.rawValue,
                                      password: $password,
                                      tintColor: assets.tinitColor)
                forgotPasswordPopUpView()
            }

            if #available(iOS 15.0, *) {
                locationText()
                    .foregroundStyle(assets.headingTextColor)
            } else {
                locationText()
            }
        }
        .padding(.vertical)
    }

    @ViewBuilder
    private func forgotPasswordPopUpView() -> some View {
        Button(action: {
            isPopupPresented.toggle()
        }, label: {
            ForgotPasswordView(text: LoginPageString.forgotPassword.localized(),
                               textColor: assets.headingTextColor,
                               lineColor: assets.tinitColor)
            .frame(maxWidth: .infinity, alignment: .leading)
        })
        .sheet(isPresented: $isPopupPresented) {
            if #available(iOS 16.0, *) {
                ForgotPasswordPopUpView()
                    .readHeight()
                    .onPreferenceChange(HeightPreferenceKey.self) { height in
                        if let height = height {
                            detentHeight = height
                        }
                    }
                    .presentationDetents([.height(detentHeight)])
                    .presentationDragIndicator(.visible)
            } else {
                ForgotPasswordPopUpView()
                    .readHeight()
                    .onPreferenceChange(HeightPreferenceKey.self) { height in
                        if let height {
                            detentHeight = height
                        }
                    }
            }
        }
    }
}

struct LoginContainerViewPreview: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var location: String = "USA"
    @State private var isPasswordHidden: Bool = true
    private var locations: [String] = ["USA", "Canada", "France", "Germany", "Africa"]

   // var assets: LoginContainerColor = LoginContainerColor()
    var body: some View {
        LoginContainerView(
            email: $email,
            password: $password,
            location: $location,
            isPasswordHidden: $isPasswordHidden,
            locations: locations)
    }
}

#Preview {
    LoginContainerViewPreview()
}
