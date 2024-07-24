//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/18/24.
//

import SwiftUI
import Combine

public struct DropDownMenuView: View {
    private enum Constants {
        static let buttonHeight: CGFloat = 40
    }

    @State private var selectedIndex: Int = 0
    @State private var selectedItem: String = ""

    @Binding var title: String
    let elements: [String]

    var textColor: Color = .black
    var font: Font = .system(size: 14, weight: .regular)

    let selectedElement: (Int, String) -> Void

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
                .background(Color.pink)
            } label: {
                titleText(elements[selectedIndex])

            }
        } else {
            Picker(selection: $selectedItem) {
                ForEach(elements, id: \.self) { element in
                    Text(element)
                        .font(font)
                        .foregroundColor(textColor)
                }
            } label: {
                titleText(elements[selectedIndex])
            }
            .onAppear {
                guard let index = elements.firstIndex(where: {$0 == selectedItem}) else {
                    selectedIndex = 0
                    return
                }
                selectedIndex = index
            }
            .colorMultiply(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .pickerStyle(.automatic)
        }
    }

    @ViewBuilder
    private func titleText(_ text: String) -> some View {
        Text(text)
            .font(font)
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity, minHeight: Constants.buttonHeight, alignment: .leading)
    }
}
