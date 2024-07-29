//
//  WelcomeBannerView.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/10/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A view that displays a welcome banner with a title and a secondary title.
public struct WelcomeBannerView: View {
    private enum Constants {
        static let titleFontSize: CGFloat = 22
        static let secondaryTitleFontSize: CGFloat = 42
        static let verticalSpacing: CGFloat = 10
    }

    var title: String
    var secondaryTitle: String
    var assets: LoginContainerAssetsProtocol

    /// The content and behaviorof the view
    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
            if #available(iOS 15.0, *) {
                titleText()
                    .foregroundStyle(assets.headingTextColor)
                secondaryTitleText()
                    .foregroundStyle(assets.headingTextColor)
            } else {
                titleText()
                secondaryTitleText()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    /// Initializes a new instance of `WelcomeBannerView`.
    ///
    /// - Parameters:
    ///   - title: The main title text.
    ///   - secondaryTitle: The secondary title text.
    ///   - assets: The assets contains color for the components.
    public init(title: String,
                secondaryTitle: String,
                assets: LoginContainerAssetsProtocol = LoginContainerAssets()) {
        self.title = title
        self.secondaryTitle = secondaryTitle
        self.assets = assets
    }

    @ViewBuilder
    private func titleText() -> some View {
        Text(title)
            .font(.system(size: Constants.titleFontSize, weight: .medium))
            .foregroundColor(assets.headingTextColor)
    }

    @ViewBuilder
    private func secondaryTitleText() -> some View {
        Text(secondaryTitle)
            .font(.system(size: Constants.secondaryTitleFontSize, weight: .semibold))
            .foregroundColor(assets.headingTextColor)
    }
}

