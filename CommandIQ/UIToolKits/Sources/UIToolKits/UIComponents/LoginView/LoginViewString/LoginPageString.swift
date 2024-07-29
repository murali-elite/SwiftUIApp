//
//  File.swift
//  
//
//  Created by Murali moorthy on 7/24/24.
//

import Foundation

/// Enum for representing login container strings.
public enum LoginPageString: String {
    /// The email field label.
    case email = "Email"
    /// The password field label.
    case password = "Password"
    /// The location field label.
    case location = "Location"
    /// The forgot password label.
    case forgotPassword = "Forgot Password?"
    /// The log in label.
    case logIn = "Log In"
    /// The sign up label.
    case signIn = "Sign Up"
    /// The don't have a login label.
    case dontHaveALogIn = "Don’t have a Login?"
    
    /// Returns the localized string for the enum case.
    func localized(bundle: Bundle = .main) -> String {
        switch self {
        case .email:
            return NSLocalizedString("Email", bundle: bundle, comment: "Email field label")

        case .password:
            return NSLocalizedString("Password", bundle: bundle, comment: "Password field label")

        case .location:
            return NSLocalizedString("Location", bundle: bundle, comment: "Location field label")

        case .forgotPassword:
            return NSLocalizedString("Forgot Password?",
                                     bundle: bundle, comment: "Forgot Password label")
        case .logIn:
            return NSLocalizedString("Log In",
                                     bundle: bundle, comment: "Log In label")
        case .signIn:
            return NSLocalizedString("Sign Up",
                                     bundle: bundle, comment: "Sign Up label")
        case .dontHaveALogIn:
            return NSLocalizedString("Don’t have a Login?",
                                     bundle: bundle, comment: "Don’t have a Login? label")
        }
    }
}
