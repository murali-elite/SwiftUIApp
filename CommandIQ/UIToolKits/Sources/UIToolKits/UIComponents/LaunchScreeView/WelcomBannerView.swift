//
//  File.swift
//  
//
//  Created by Murali moorthy on 7/3/24.
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

    /// Initializes a new instance of `WelcomeBannerView`.
    ///
    /// - Parameters:
    ///   - title: The main title text.
    ///   - secondaryTitle: The secondary title text.
    public init(title: String, secondaryTitle: String) {
        self.title = title
        self.secondaryTitle = secondaryTitle
    }

    @ViewBuilder
    private func titleText() -> some View {
        Text(title)
            .font(.system(size: Constants.titleFontSize, weight: .medium))
            .foregroundColor(.white)
    }

    @ViewBuilder
    private func secondaryTitleText() -> some View {
        Text(secondaryTitle)
            .font(.system(size: Constants.secondaryTitleFontSize, weight: .semibold))
            .foregroundColor(.white)
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
            if #available(iOS 15.0, *) {
                titleText()
                    .foregroundStyle(.white)
                secondaryTitleText()
                    .foregroundStyle(.white)
            } else {
                titleText()
                secondaryTitleText()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
