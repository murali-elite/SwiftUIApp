//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/17/24.
//

import SwiftUI

/// A view that displays a sign-up button with a heading and button text.
public struct SignUpButtonView: View {
    
    // MARK: - Constants

    private enum Constants {
        static let fontSize: CGFloat = 14
        static let fontWeight: Font.Weight = .regular
    }
    
    // MARK: - Properties
    
    /// The heading text of the view.
    var heading: String
    
    /// The text of the button.
    var buttonText: String
    
    /// The color of the heading text.
    var headingColor: Color
    
    /// The color of the button text.
    var buttonTextColor: Color
    
    /// The color of the button border.
    var borderColor: Color
    
    // MARK: - Initializer
    
    /// Initializes a new instance of the `SignUpButtonView`.
    ///
    /// - Parameters:
    ///   - heading: The heading text of the view.
    ///   - buttonText: The text of the button.
    ///   - headingColor: The color of the heading text.
    ///   - buttonTextColor: The color of the button text.
    public init(heading: String, buttonText: String, headingColor: Color, buttonTextColor: Color, borderColor: Color) {
        self.heading = heading
        self.buttonText = buttonText
        self.headingColor = headingColor
        self.buttonTextColor = buttonTextColor
        self.borderColor = borderColor
    }
    
    // MARK: - Body
    
    /// The content and behavior of the `SignUpButtonView`.
    public var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                headingText()
                    .foregroundStyle(headingColor)
            } else {
                headingText()
            }
            
            Button {
                // Add action here
            } label: {
                if #available(iOS 15.0, *) {
                    buttonHeadingText()
                        .foregroundStyle(buttonTextColor)
                } else {
                    buttonHeadingText()
                }
            }
        }
    }
    
    // MARK: - Private Methods

    /// A view builder for the heading text.
    ///
    /// - Returns: A view that displays the heading text.
    @ViewBuilder
    private func headingText() -> some View {
        Text(heading)
            .font(.system(size: Constants.fontSize, weight: Constants.fontWeight))
            .foregroundColor(headingColor)
    }
    
    /// A view builder for the button heading text.
    ///
    /// - Returns: A view that displays the button heading text.
    @ViewBuilder
    private func buttonHeadingText() -> some View {
        Text(buttonText)
            .frame(maxWidth: .infinity)
            .font(.system(size: Constants.fontSize, weight: Constants.fontWeight))
            .buttonStyleViewModifier(borderColor: borderColor)
            .foregroundColor(buttonTextColor)
    }
}
