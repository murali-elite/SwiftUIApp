//
//  LoginTitleView.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/17/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

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
    }

    // MARK: - Initializer

    /// Initializes a new instance of the `LoginTitleView`.
    ///
    /// - Parameters:
    ///   - title: The title text.
    ///   - subTitle: The subtitle text.
    ///   - textColor: The color of the text. The default value is `.white`.
    public init(title: String,
                subTitle: String,
                assets: LoginTitleAsstesProtocol = LoginTitleAssets()) {
        self.title = title
        self.subTitle = subTitle
        self.assets = assets
    }

    // MARK: - Private Methods

    /// A view builder for the title text.
    ///
    /// - Returns: A view that displays the title text.
    @ViewBuilder
    private func titleText() -> some View {
        Text(title)
            .font(assets.headingFont)
            .foregroundColor(assets.headerTextColor)
    }

    /// A view builder for the subtitle text.
    ///
    /// - Returns: A view that displays the subtitle text.
    @ViewBuilder
    private func subTitleText() -> some View {
        Text(subTitle)
            .font(assets.subHeadingFont)
            .foregroundColor(assets.subHeadingTextColor)
    }
}
