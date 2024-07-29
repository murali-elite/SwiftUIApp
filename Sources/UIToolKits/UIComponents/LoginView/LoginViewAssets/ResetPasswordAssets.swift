//
//  ForgotPasswordColors.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/24/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// Struct implementing the `ForgotPasswordAsset` protocol, providing default colors for the Forgot Password view.
public struct ResetPasswordAssets: ResetPasswordAssetsProtocol {
    /// The color of the header text.
    public var headerTextColor: Color

    /// The color of the description text.
    public var descriptionTextColor: Color

    /// The color of the input header text.
    public var inputHeaderTextColor: Color

    /// The color of the bottom line.
    public var bottomLineColor: Color

    /// The background color of the submit button.
    public var submitBackgroundColor: Color

    /// The foreground color of the submit button.
    public var submitForgroundColor: Color

    /// The background color of the cancel button.
    public var cancelBackgroundColor: Color

    /// The foreground color of the cancel button.
    public var cancelForgroundColor: Color

    /// Initializes a new instance of `ForgotPasswordColors`.
    ///
    /// - Parameters:
    ///   - headerTextColor: The color of the header text. Defaults to black.
    ///   - descriptionTextColor: The color of the description text. Defaults to gray.
    ///   - inputHeaderTextColor: The color of the input header text. Defaults to black.
    ///   - bottomLineColor: The color of the bottom line. Defaults to gray.
    ///   - submitBackgroundColor: The background color of the submit button. Defaults to `appPrimaryColor`.
    ///   - submitForgroundColor: The foreground color of the submit button. Defaults to white.
    ///   - cancelBackgroundColor: The background color of the cancel button. Defaults to white.
    ///   - cancelForgroundColor: The foreground color of the cancel button. Defaults to `appPrimaryColor`.
    public init(headerTextColor: Color = .black,
                descriptionTextColor: Color = .gray,
                inputHeaderTextColor: Color = .black,
                bottomLineColor: Color = .gray,
                submitBackgroundColor: Color = .blue,
                submitForgroundColor: Color = .white,
                cancelBackgroundColor: Color = .white,
                cancelForgroundColor: Color = .blue) {
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
