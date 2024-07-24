//
//  LoginResetPageString.swift
//  
//
//  Created by Murali moorthy on 7/24/24.
//

import SwiftUI

/// Enum for representing login container strings.
public enum LoginResetPageString: String {
    /// The reset password label.
    case resetPassword = "Reset Password"
    /// The submit label.
    case submit = "Submit"
    /// The cancel label.
    case cancel = "Cancel"
    /// The reset password description label.
    case resetPasswordDescription = "Enter your email address and choose your location to reset the password"

    /// Returns the localized string for the enum case.
    func localized(bundle: Bundle = .main) -> String {
        switch self {
        case .resetPassword:
            return NSLocalizedString("Reset Password",
                                     bundle: bundle,
                                     comment: "Reset Password label")

        case .resetPasswordDescription:
            return NSLocalizedString("Enter your email address and choose your location to reset the password",
                                     bundle: bundle,
                                     comment: "Reset Password Description label")

        case .submit:
            return NSLocalizedString("Submit",
                                     bundle: bundle,
                                     comment: "Submit label")

        case .cancel:
            return NSLocalizedString("Cancel",
                                     bundle: bundle,
                                     comment: "Cancel label")
        }
    }
}
