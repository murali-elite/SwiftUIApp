//
//  SwiftUIView.swift
//
//
//  Created by Murali moorthy on 7/18/24.
//

import SwiftUI

/// A view that displays a password text field with a toggle for secure text entry.
public struct PasswordTextFieldView: View {
    // MARK: - Properties

    /// The title for the text field.
    var title: String

    /// The password text binding.
    @Binding var password: String

    /// A boolean indicating whether the text is secured.
    @State var isSecured: Bool

    /// The color for the title text.
    var titleColor: Color

    /// The color for the tint of the text field.
    var tintColor: Color

    // MARK: - Body

    public var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                if isSecured {
                    textField()
                        .foregroundStyle(titleColor)
                } else {
                    secureTextField()
                        .foregroundStyle(titleColor)
                }
            } else {
                if isSecured {
                    textField()
                } else {
                    secureTextField()
                }
            }
        }
    }

    // MARK: - Initializer

    /// Initializes a new instance of the `PasswordTextFieldView`.
    ///
    /// - Parameters:
    ///   - title: The title for the text field.
    ///   - password: The binding to the password text.
    ///   - isSecured: A boolean indicating whether the text is secured. The default value is `true`.
    ///   - titleColor: The color for the title text. The default value is `.black`.
    ///   - tintColor: The color for the tint of the text field. The default value is `.black`.
    public init(title: String,
                password: Binding<String>,
                isSecured: Bool = true,
                titleColor: Color = .black,
                tintColor: Color = .black) {
        self.title = title
        self._password = password
        self.isSecured = isSecured
        self.titleColor = titleColor
        self.tintColor = tintColor
    }

    // MARK: - Private Views

    /// Creates a secure field view.
    @ViewBuilder
    private func textField() -> some View {
        Text(title)
        SecureField("", text: $password)
            .foregroundColor(titleColor)
            .secureFieldViewModifier(title: title,
                                     isTapped: $isSecured,
                                     titleColor: titleColor,
                                     tintColor: tintColor)
    }

    /// Creates a text field view.
    @ViewBuilder
    private func secureTextField() -> some View {
        Text(title)
        TextField("", text: $password)
            .foregroundColor(.white)
            .secureFieldViewModifier(title: title,
                                     isTapped: $isSecured,
                                     titleColor: titleColor,
                                     tintColor: tintColor)
    }
}
