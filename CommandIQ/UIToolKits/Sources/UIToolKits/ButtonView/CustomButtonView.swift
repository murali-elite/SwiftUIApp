//
//  ButtonStyleViewModifier.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/10/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A view modifier for styling buttons with a custom background color and border color.
public struct ButtonStyleViewModifier: ViewModifier {
    // MARK: - Constants

    private enum ButtonStyle {
        static let buttonHeight: CGFloat = 43
        static let cornerRadius: CGFloat = 5
        static let borderWidth: CGFloat = 1
        static let fontSize: CGFloat = 16
        static let fontWeight: Font.Weight = .medium
    }

    /// The background color of the button.
    var backgroundColor: Color

    /// The border color of the button.
    var borderColor: Color

    /// Applies the styling to the provided content.
    ///
    /// - Parameter content: The content to style.
    /// - Returns: A view with the applied button styling.
    public func body(content: Content) -> some View {
        content
            .font(.system(size: ButtonStyle.fontSize, weight: ButtonStyle.fontWeight))
            .frame(maxWidth: .infinity, minHeight: ButtonStyle.buttonHeight)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: ButtonStyle.cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: ButtonStyle.cornerRadius)
                    .stroke(borderColor, lineWidth: ButtonStyle.borderWidth)
            )
    }
}
