//
//  SwiftUIView.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/19/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A view that presents a dropdown menu with a list of selectable elements.
public struct DropDownMenuView: View {
    // MARK: - Constants

    private enum Constants {
        static let buttonHeight: CGFloat = 40
    }

    // MARK: - Properties

    @State private var selectedIndex: Int = 0
    @State private var selectedItem: String = ""

    /// The binding to the title of the dropdown.
    @Binding var title: String

    /// An array of strings representing the elements in the dropdown.
    let elements: [String]

    /// The color of the title text.
    var textColor: Color

    /// A closure that gets called when an element is selected.
    ///  The closure provides the index and the string of the selected element.
    let selectedElement: (Int, String) -> Void

    // MARK: - Body
    /// The content and behavior of the `DropDownMenuView`.
    public var body: some View {
        if #available(iOS 14.0, *) {
            Menu {
                ForEach(elements.indices.reversed(), id: \.self) { index in
                    Button(action: {
                        selectedIndex = index
                        selectedElement(index, elements[index])
                    }, label: {
                        titleText(elements[index])
                    })
                }
            } label: {
                titleText(elements[selectedIndex])
            }
        } else {
            Picker(selection: $selectedItem) {
                ForEach(elements, id: \.self) { element in
                    Text(element)
                }
            } label: {
                titleText(elements[selectedIndex])
            }
            .onAppear {
                guard let index = elements.firstIndex(where: { $0 == selectedItem }) else {
                    selectedIndex = 0
                    return
                }
                selectedIndex = index
                selectedElement(index, elements[index])
            }
            .colorMultiply(textColor == .white ? .black : .white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .pickerStyle(.automatic)
        }
    }

    // MARK: - Private Methods

    @ViewBuilder
    private func titleText(_ text: String) -> some View {
        Text(text)
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity, minHeight: Constants.buttonHeight, alignment: .leading)
    }
}

