//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/22/24.
//

import SwiftUI


public protocol ForgotPasswordAsset {
    var headerTextColor: Color { get set }
    var descriptionTextColor: Color { get set }
    var inputHeaderTextColor: Color { get set }
    var bottomLineColor: Color { get set }
    var submitBackgroundColor: Color { get set }
    var cancelBackgroundColor: Color { get set }
    var submitForgroundColor: Color { get set }
    var cancelForgroundColor: Color { get set }
}

public struct ForgotPasswordColors: ForgotPasswordAsset {
    public var headerTextColor: Color
    public var descriptionTextColor: Color
    public var inputHeaderTextColor: Color
    public var bottomLineColor: Color
    public var submitBackgroundColor: Color
    public var submitForgroundColor: Color
    public var cancelBackgroundColor: Color
    public var cancelForgroundColor: Color
   
    public init(headerTextColor: Color = .black,
                descriptionTextColor: Color = .gray,
                inputHeaderTextColor: Color = .black,
                bottomLineColor: Color = .gray,
                submitBackgroundColor: Color = .appPrimaryColor,
                submitForgroundColor: Color = .white,
                cancelBackgroundColor: Color = .white,
                cancelForgroundColor: Color = .appPrimaryColor) {
        self.headerTextColor = headerTextColor
        self.descriptionTextColor = descriptionTextColor
        self.inputHeaderTextColor = inputHeaderTextColor
        self.bottomLineColor = bottomLineColor
        self.submitBackgroundColor = submitBackgroundColor
        self.submitForgroundColor = submitForgroundColor
        self.cancelBackgroundColor = cancelBackgroundColor
        self.cancelForgroundColor = cancelForgroundColor
    }
}

/// A view for resetting the password, including fields for email and location.
public struct ForgotPasswordPopUpView: View {
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
    var assets: ForgotPasswordAsset = ForgotPasswordColors()
    @State var email: String = ""
    @State var location: String = "USA"
    var locations: [String] = ["USA", "Canada", "UK"]

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

            ResetActionsButtonView()
        }
        .padding()
    }

    // MARK: - Private Methods

    @ViewBuilder
    private func resetDescriptionText() -> some View {
        Text(LoginResetPageString.resetPasswordDescription.localized())
            .font(.system(size: Constants.descriptionFontSize))
            .foregroundColor(.black.opacity(Constants.colorOpacity))
    }
}

/// A view containing the submit and cancel buttons for the reset password popup.
struct ResetActionsButtonView: View {
    // MARK: - Constants

    private enum Constants {
        static let spacing: CGFloat = 20
    }

    /// The content and behavior of the `ResetSubmitCancelButtonView`.
    var body: some View {
        VStack(spacing: Constants.spacing) {
            Button {
                // Submit action
            } label: {
                HStack {
                    Text("Submit")
                        .buttonStyleViewModifier(backgroundColor: .blue)
                        .foregroundColor(.white)
                }
            }
            Button {
                // Cancel action
            } label: {
                Text("Cancel")
                    .buttonStyleViewModifier(borderColor: .blue)
                    .foregroundColor(.blue)
            }
        }
    }
}
