//
//  LoginContainerAssets.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/24/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// Struct implementing the `LoginContainerAssets` protocol, providing default colors for a login container.
public struct LoginContainerAssets: LoginContainerAssetsProtocol {
    /// Constants used for font sizes in the login container.
    public enum Constants {
        /// The font size for the heading.
        public static let headerFontSize: CGFloat = 15
        /// The font size for the input field.
        public static let inputFieldFontSize: CGFloat = 16
        /// The font size for the forgot password text.
        public static let forgotPasswordFontSize: CGFloat = 14
    }

    /// The font used for the heading text.
    public var headingFont: Font
    /// The font used for the input field text.
    public var inputFieldFont: Font
    /// The font used for the forgot password text.
    public var forgotPasswordFont: Font
    /// The color of the heading text.
    public var headingTextColor: Color
    /// The color used for the initialization (if this is a typo, consider correcting it).
    public var tintColor: Color

    /// Initializes a `LoginContainerAssets` instance with specified colors and fonts.
    /// - Parameters:
    ///   - headingTextColor: The color of the heading text. Defaults to `.white`.
    ///   - tinitColor: The color used for initialization. Defaults to `.white`.
    ///   - headingFont: The font used for the heading text.
    ///     Defaults to a system font with a size of `15` and weight `.regular`.
    ///   - inputFieldFont: The font used for the input field text.
    ///     Defaults to a system font with a size of `16` and weight `.regular`.
    ///   - forgotPasswordFont: The font used for the forgot password text.
    ///     Defaults to a system font with a size of `14` and weight `.regular`.
    public init(headingTextColor: Color = .white,
                tintColor: Color = .white,
                headingFont: Font = .system(size: Constants.headerFontSize, weight: .regular),
                inputFieldFont: Font = .system(size: Constants.inputFieldFontSize, weight: .regular),
                forgotPasswordFont: Font = .system(size: Constants.forgotPasswordFontSize, weight: .regular)) {
        self.headingTextColor = headingTextColor
        self.tintColor = tintColor
        self.headingFont = headingFont
        self.inputFieldFont = inputFieldFont
        self.forgotPasswordFont = forgotPasswordFont
    }
}
