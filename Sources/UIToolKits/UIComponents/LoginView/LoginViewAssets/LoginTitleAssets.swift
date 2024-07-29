//
//  LoginTitleAssets.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/25/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A struct that provides colors and fonts for the title assets in a login view.
public struct LoginTitleAssets: LoginTitleAsstesProtocol {
    /// Constants used for font sizes in the login title assets.
    public enum Constants {
        /// The font size for the header text.
        public static var headerFontSize: CGFloat = 32

        /// The font size for the subheading text.
        public static var subHeadingFontSize: CGFloat = 15
    }

    /// The color of the header text.
    public var headerTextColor: Color

    /// The color of the subheading text.
    public var subHeadingTextColor: Color

    /// The font used for the header text.
    public var headingFont: Font

    /// The font used for the subheading text.
    public var subHeadingFont: Font

    /// Initializes a `LoginTitleAssets` instance with specified colors and fonts.
    /// - Parameters:
    ///   - headerTextColor: The color of the header text. Defaults to `.white`.
    ///   - subHeadingTextColor: The color of the subheading text. Defaults to `.white`.
    ///   - headingFont: The font used for the header text.
    ///     Defaults to a system font with a size of `32` and weight `.bold`.
    ///   - subHeadingFont: The font used for the subheading text.
    ///      Defaults to a system font with a size of `15` and weight `.regular`.
    public init(headerTextColor: Color = .white,
                subHeadingTextColor: Color = .white,
                headingFont: Font = .system(size: Constants.headerFontSize, weight: .bold),
                subHeadingFont: Font = .system(size: Constants.subHeadingFontSize, weight: .regular)) {
        self.headerTextColor = headerTextColor
        self.subHeadingTextColor = subHeadingTextColor
        self.headingFont = headingFont
        self.subHeadingFont = subHeadingFont
    }
}
