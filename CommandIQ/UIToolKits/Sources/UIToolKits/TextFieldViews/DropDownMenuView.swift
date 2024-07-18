//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/18/24.
//

import SwiftUI

public struct DropDownMenuView<Element: Hashable>: View {
    @State private var selectedIndex: Int?
    let elements: [Element]
    let title: String
    let selectedElement: (Int, Element) -> ()
    
   public var body: some View {
        Menu(selectedIndex == nil ? title : "\(elements[selectedIndex!])") {
            ForEach(elements.indices.reversed(), id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                    selectedElement(index, elements[index])
                }) {
                    Text(String(describing: elements[index]))
                        .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview{
    DropDownMenuView(elements: ["First", "Second", "Third"], title: "Hello") { index, element in
        print("Selected", index, element)
    }
}


