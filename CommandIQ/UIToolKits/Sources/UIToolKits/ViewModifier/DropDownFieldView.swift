//
//  DropDownViewModifier.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/10/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A closure type used to handle the selection of an element in the dropdown.
public typealias SelectedElementClouser = (Int, String) -> Void

/// A view modifier that adds a title and a dropdown icon to a view.
public struct DropDownViewModifier: ViewModifier {
    // MARK: - Constants

    private enum Constants {
        static let titleFontSize: CGFloat = 15
        static let titleFontWeight: Font.Weight = .regular
        static let contentMinHeight: CGFloat = 35
        static let dividerHeight: CGFloat = 1
    }

    // MARK: - Properties

    /// The binding to the title of the dropdown.
    @Binding var title: String

    /// An array of strings representing the elements in the dropdown.
    let elements: [String]

    /// The color of the title text.
    var textColor: Color

    /// The font of the title text.
    var font: Font = .system(size: Constants.titleFontSize, weight: Constants.titleFontWeight)

    /// The color of the tint.
    var tintColor: Color

    /// A closure that gets called when an element is selected.
    ///  The closure provides the index and the string of the selected element.
    let selectedElement: SelectedElementClouser

    // MARK: - Body

    /// The content and behavior of the `DropDownViewModifier`.
    ///
    /// - Parameter content: The content to be modified.
    /// - Returns: A view that displays the modified content.
    public func body(content: Content) -> some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                content
                ZStack {
                    HStack {
                        Spacer()
                        if #available(iOS 15.0, *) {
                            Image(systemName: "chevron.down")
                                .foregroundStyle(tintColor)
                        } else {
                            Image(systemName: "chevron.down")
                                .foregroundColor(tintColor)
                        }
                    }

                    DropDownMenuView(title: $title,
                                     elements: elements,
                                     textColor: textColor,
                                     font: font,
                                     selectedElement: selectedElement)
                        .frame(maxWidth: .infinity, minHeight: Constants.contentMinHeight)
                }
            }

            Divider()
                .frame(height: Constants.dividerHeight)
                .background(tintColor)
        }
    }
}
