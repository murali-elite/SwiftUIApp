//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/22/24.
//

import SwiftUI

/// Protocol defining the assets for a login container, such as colors.
public protocol LoginContainerAssetsProtocol {
    /// The color of the heading text.
    var headingTextColor: Color { get set }

    /// The color used for tints.
    var tintColor: Color { get set }
    
    var headingFont: Font { get set }
    var inputFieldFont: Font { get set }
    var forgotPasswordFont: Font { get set }
}



public struct LoginContainerColors: LoginContainerAssetsProtocol {
    public var headingFont: Font
    public var inputFieldFont: Font
    public var forgotPasswordFont: Font
    
    public enum Constants {
        public static let headingFontSize: CGFloat = 15
        public static let inputFieldFontSize: CGFloat = 16
        public static let forgotPasswordFontSize: CGFloat = 14
    }
    
    /// The color of the heading text.
    public var headingTextColor: Color
    
    /// The color used for tints.
    public var tintColor: Color
    
    /// Initializes a new instance of `LoginContainerColors`.
    ///
    /// - Parameters:
    ///   - headingTextColor: The color of the heading text. Defaults to white.
    ///   - tintColor: The color used for tints. Defaults to white.
    ///   - headingFont: The font used for the heading text. Defaults to a system font of size 15, weight regular.
    ///   - inputFieldFont: The font used for the input fields. Defaults to a system font of size 16, weight regular.
    ///   - forgotPasswordFont: The font used for the forgot password text. Defaults to a system font of size 14, weight regular.
    public init(
        headingTextColor: Color = .white,
        tintColor: Color = .white,
        headingFont: Font = .system(size: Constants.headingFontSize, weight: .regular),
        inputFieldFont: Font = .system(size: Constants.inputFieldFontSize, weight: .regular),
        forgotPasswordFont: Font = .system(size: Constants.forgotPasswordFontSize, weight: .regular)
    ) {
        self.headingTextColor = headingTextColor
        self.tintColor = tintColor
        self.headingFont = headingFont
        self.inputFieldFont = inputFieldFont
        self.forgotPasswordFont = forgotPasswordFont
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
    var assets: LoginContainerAssetsProtocol
    @Binding var email: String
    @Binding var password: String
    @Binding var location: String
    @Binding var isPasswordHidden: Bool
    @Binding var isPopupPresented: Bool
    var locations: [String]

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
                    assets: LoginContainerAssetsProtocol = LoginContainerColors()) {
            self._email = email
            self._password = password
            self._location = location
            self._isPasswordHidden = isPasswordHidden
            self._isPopupPresented = isPopupPresented
            self.locations = locations
            self.assets = assets
        }

    @ViewBuilder
    private func forgotPasswordView() -> some View {
        Text(LoginPageString.forgotPassword.localized())
            .accessibility(addTraits: .isButton)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(assets.headingTextColor)
            .underlined(assets.tintColor)
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
                                  tintColor: assets.tintColor) { _, _ in
                //
            }
    }
}

struct LoginContainerViewPreview: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var location: String = "USA"
    @State private var isPasswordHidden: Bool = true
    @State private var isPopupPresented: Bool = true
    private var locations: [String] = ["USA", "Canada", "France", "Germany", "Africa"]

   // var assets: LoginContainerColor = LoginContainerColor()
    var body: some View {
        LoginContainerView(
            email: $email,
            password: $password,
            location: $location,
            isPasswordHidden: $isPasswordHidden, isPopupPresented: $isPopupPresented,
            locations: locations)
    }
}



public struct LoginContainerColors1: LoginContainerAssetsProtocol {
    // MARK: - Constants
    public static let headerFontSize: CGFloat = 15
    public static let inputFieldFontSize: CGFloat = 16
    public static let forgotPasswordFontSize: CGFloat = 14

    public var headingFont: Font
    public var inputFieldFont: Font
    public var forgotPasswordFont: Font
    
    /// The color of the heading text.
    public var headingTextColor: Color
    
    /// The color used for tints.
    public var tintColor: Color
    
    /// Initializes a new instance of `LoginContainerColors`.
    ///
    /// - Parameters:
    ///   - headingTextColor: The color of the heading text. Defaults to white.
    ///   - tintColor: The color used for tints. Defaults to white.
    public init(headingTextColor: Color = .white,
                tintColor: Color = .white,
                headingFont: Font = .system(size: LoginContainerColors1.headerFontSize, weight: .regular),
                inputFieldFont: Font = .system(size: LoginContainerColors1.inputFieldFontSize, weight: .regular),
                forgotPasswordFont: Font = .system(size: LoginContainerColors1.forgotPasswordFontSize, weight: .regular)) {
        self.headingTextColor = headingTextColor
        self.tintColor = tintColor
        self.headingFont = headingFont
        self.inputFieldFont = inputFieldFont
        self.forgotPasswordFont = forgotPasswordFont
    }
}
