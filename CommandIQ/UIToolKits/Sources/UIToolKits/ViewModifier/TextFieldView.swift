//
//  TextFieldViewModifier.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/10/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A view modifier that adds a title and a divider to a text field.
public struct TextFieldViewModifier: ViewModifier {
    // MARK: - Constants

    private enum Constants {
        static let titleFontSize: CGFloat = 15
        static let titleFontWeight: Font.Weight = .regular
        static let contentMinHeight: CGFloat = 35
        static let dividerHeight: CGFloat = 1
    }

    // MARK: - Properties

    /// The title text to display above the text field.
    var title: String

    /// The color of the title text.
    var titleColor: Color

    /// The color of the divider.
    var tintColor: Color

    // MARK: - Private Methods

    /// A view builder for the title text.
    ///
    /// - Returns: A view that displays the title text.
    @ViewBuilder
    private func titleText() -> some View {
        Text(title)
            .font(.system(size: Constants.titleFontSize, weight: Constants.titleFontWeight))
            .foregroundColor(titleColor)
    }

    // MARK: - Body

    /// The content and behavior of the `TextFieldViewModifier`.
    ///
    /// - Parameter content: The content to be modified.
    /// - Returns: A view that displays the modified content.
    public func body(content: Content) -> some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                if #available(iOS 15.0, *) {
                    titleText()
                        .foregroundStyle(titleColor)
                } else {
                    titleText()
                }
                content // TextField
                    .frame(maxWidth: .infinity, minHeight: Constants.contentMinHeight)
            }
            Divider()
                .frame(height: Constants.dividerHeight)
                .background(tintColor)
        }
    }
}
