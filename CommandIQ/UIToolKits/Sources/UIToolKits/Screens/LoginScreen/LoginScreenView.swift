//
//  SwiftUIView.swift
//
//
//  Created by Murali moorthy on 7/18/24.
//

import SwiftUI

/// A view representing the login screen, containing fields for email, password, and location,
/// as well as buttons for logging in and signing up.
public struct LoginScreenView: View {
    // MARK: - Properties

    @State public var email: String = ""
    @State public var password: String = ""
    @State public var location: String = "USA"
    @State public var isPasswordHidden: Bool = true
    @State public var isPopupPresented = false
    private let locations: [String] = ["USA", "Canada", "France", "Germany", "Africa"]

    private enum Constants {
        static let verticalSpacing: CGFloat = 10
        static let bottomPadding: CGFloat = 10
    }

    // MARK: - Body

    /// The main content view for the `LoginScreenView`.
    public var body: some View {
            if #available(iOS 16.0, *) {
                NavigationStack {
                   // content
                }
            } else {
                NavigationView {
                   // content
                }
            }
    }

    // MARK: - Content

    /// The main content view builder for the `LoginScreenView`.
    @ViewBuilder
    private var content: some View {
        ZStack {
//            Color(.red)
//                .ignoredSafeAreaBackgroundColor()
            ScrollView {
                VStack(spacing: Constants.verticalSpacing) {
                    WelcomeBannerView(title: "Welcome", secondaryTitle: "CommandIQ")
                        .padding(.bottom, Constants.bottomPadding)

                    LoginTitleView(
                        title: "Login",
                        subTitle: "Everything you need to secure and control your home network and connected devices."
                    )

                    // Input TextFields
                    LoginContainerView(
                        email: $email,
                        password: $password,
                        location: $location,
                        isPasswordHidden: $isPasswordHidden, isPopupPresented: $isPopupPresented,
                        locations: locations
                    )

                    // Container for Login, Signup title, and Signup Button
                    LoginSignUpButtonContainerView()
                }
                .padding()
            }
        }
    }
}

#Preview {
    LoginScreenView()
}

public struct IgnoredSafeAreaBackgroundColor: ViewModifier {

    public func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .ignoresSafeArea()
        } else {
            content
                .edgesIgnoringSafeArea(.all)
        }
    }
}

extension Color {
    func ignoredSafeAreaBackgroundColor() -> some View {
        modifier(IgnoredSafeAreaBackgroundColor())
    }
}
