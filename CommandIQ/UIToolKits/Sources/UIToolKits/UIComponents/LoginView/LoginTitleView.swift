//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/17/24.
//

import SwiftUI

/// A protocol that defines the properties for the title assets in a login view.
public protocol LoginTitleAsstesProtocol {
    /// The color of the header text.
    var headerTextColor: Color { get set }
    
    /// The color of the subheading text.
    var subHeadingTextColor: Color { get set }
    
    /// The font used for the header text.
    var headingFont: Font { get set }
    
    /// The font used for the subheading text.
    var subHeadingFont: Font { get set }
}

/// A struct that provides colors and fonts for the title assets in a login view.
public struct LoginTitleAsstes: LoginTitleAsstesProtocol {
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
    
    /// Initializes a `LoginTitleAsstes` instance with specified colors and fonts.
    /// - Parameters:
    ///   - headerTextColor: The color of the header text. Defaults to `.white`.
    ///   - subHeadingTextColor: The color of the subheading text. Defaults to `.white`.
    ///   - headingFont: The font used for the header text. Defaults to a system font with a size of `32` and weight `.bold`.
    ///   - subHeadingFont: The font used for the subheading text. Defaults to a system font with a size of `15` and weight `.regular`.
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



/// A view that displays a login title with a subtitle.
public struct LoginTitleView: View {
    // MARK: - Constants

    private enum Constants {
        static var titleFontSize: CGFloat = 31
        static var subTitleFontSize: CGFloat = 16
        static var verticalSpacing: CGFloat = 10
    }

    // MARK: - Properties
    var assets: LoginTitleAsstesProtocol
    /// The title text.
    var title: String

    /// The subtitle text.
    var subTitle: String

    /// The color of the text. The default value is `.white`.
    var textColor: Color

    // MARK: - Initializer

    /// Initializes a new instance of the `LoginTitleView`.
    ///
    /// - Parameters:
    ///   - title: The title text.
    ///   - subTitle: The subtitle text.
    ///   - textColor: The color of the text. The default value is `.white`.
    public init(title: String,
                subTitle: String,
                textColor: Color = .white,
                assets: LoginTitleAsstesProtocol = LoginTitleAsstes()) {
        self.title = title
        self.subTitle = subTitle
        self.textColor = textColor
        self.assets = assets
    }

    // MARK: - Body

    /// The content and behavior of the `LoginTitleView`.
    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
            if #available(iOS 15.0, *) {
                titleText()
                    .foregroundStyle(assets.headerTextColor)
                subTitleText()
                    .foregroundStyle(assets.subHeadingTextColor)
            } else {
                titleText()
                subTitleText()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("AppPrimary_Color", bundle: .module))
    }

    // MARK: - Private Methods

    /// A view builder for the title text.
    ///
    /// - Returns: A view that displays the title text.
    @ViewBuilder
    private func titleText() -> some View {
        Text(title)
            .font(.system(size: Constants.titleFontSize, weight: .bold))
            .foregroundColor(textColor)
    }

    /// A view builder for the subtitle text.
    ///
    /// - Returns: A view that displays the subtitle text.
    @ViewBuilder
    private func subTitleText() -> some View {
        Text(subTitle)
            .font(.system(size: Constants.subTitleFontSize, weight: .regular))
            .foregroundColor(textColor)
    }
}
