//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/17/24.
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
    public init(title: String, subTitle: String, textColor: Color = .white) {
        self.title = title
        self.subTitle = subTitle
        self.textColor = textColor
    }

    // MARK: - Body

    /// The content and behavior of the `LoginTitleView`.
    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
            if #available(iOS 15.0, *) {
                titleText()
                    .foregroundStyle(textColor)
                subTitleText()
                    .foregroundStyle(textColor)
            } else {
                titleText()
                subTitleText()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
