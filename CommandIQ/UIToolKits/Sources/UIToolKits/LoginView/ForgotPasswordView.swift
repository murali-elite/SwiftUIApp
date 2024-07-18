//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/17/24.
//

import SwiftUI

/// A view that displays a forgot password link with customizable text and colors.
public struct ForgotPasswordView: View {
    
    // MARK: - Constants
    private enum Constants {
        static let fontSize: CGFloat = 14
        static let fontWeight: Font.Weight = .regular
    }
    
    // MARK: - Properties
    
    /// The text to display.
    public var text: String
    
    /// The color of the text. Default is `.black`.
    public var textColor: Color
    
    /// The color of the underline. Default is `.black`.
    public var lineColor: Color

    // MARK: - Initializer
    
    /// Initializes a new instance of the `ForgotPasswordView`.
    ///
    /// - Parameters:
    ///   - text: The text to display.
    ///   - textColor: The color of the text. The default value is `.black`.
    ///   - lineColor: The color of the underline. The default value is `.black`.
    public init(text: String, textColor: Color = .black, lineColor: Color = .black) {
        self.text = text
        self.textColor = textColor
        self.lineColor = lineColor
    }
    
    // MARK: - Body
    
    /// The content and behavior of the `ForgotPasswordView`.
    public var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                titleText()
                    .foregroundStyle(textColor)
            } else {
                titleText()
            }
        }
    }
    
    // MARK: - Private Methods

    /// A view builder for the text.
    ///
    /// - Returns: A view that displays the text.
    @ViewBuilder
    private func titleText() -> some View {
        Text(text)
            .font(.system(size: Constants.fontSize, weight: Constants.fontWeight))
            .foregroundColor(textColor)
            .underlined(lineColor)
    }
}


#Preview {
    ForgotPasswordView(text: "Forgot Password?")
}


