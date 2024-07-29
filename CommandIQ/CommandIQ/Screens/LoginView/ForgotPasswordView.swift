//
//  ForgotPasswordView.swift
//  CommandIQ
//
//  Created by Murali moorthy on 7/9/24.
//

import SwiftUI
import UIToolKits


struct DropdownItem: Identifiable {
    let id = UUID()
    let title: String
}


struct DropdownView: View {
    @Binding var selectedItem: DropdownItem?
    var items: [DropdownItem]
    var placeholder: String = "Select an item"
    
    @State private var isExpanded: Bool = false
    @State private var viewPosition: CGRect = .zero
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(selectedItem?.title ?? placeholder)
                        .foregroundColor(selectedItem == nil ? .gray : .black)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            }
            .background(
                GeometryReader { geometry in
                    Color.clear.preference(key: ViewPositionKey.self, value: geometry.frame(in: .global))
                }
            )
            .onPreferenceChange(ViewPositionKey.self) { value in
                self.viewPosition = value
            }
            
            if isExpanded {
                if viewPosition.maxY > UIScreen.main.bounds.height / 2 {
                    // Expand upwards
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(items) { item in
                            Button(action: {
                                self.selectedItem = item
                                withAnimation {
                                    self.isExpanded = false
                                }
                            }) {
                                Text(item.title)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .background(Color.white)
                            .foregroundColor(.black)
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    .transition(.move(edge: .bottom))
                } else {
                    // Expand downwards
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(items) { item in
                            Button(action: {
                                self.selectedItem = item
                                withAnimation {
                                    self.isExpanded = false
                                }
                            }) {
                                Text(item.title)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .background(Color.white)
                            .foregroundColor(.black)
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    .transition(.move(edge: .top))
                }
            }
        }
    }
}


struct ContentView1: View {
    @State private var selectedItem: DropdownItem?
    private let items = [
        DropdownItem(title: "Item 1"),
        DropdownItem(title: "Item 2"),
        DropdownItem(title: "Item 3")
    ]
    
    var body: some View {
        VStack {
            Text("Selected Item: \(selectedItem?.title ?? "None")")
                .padding()
            
            DropdownView(selectedItem: $selectedItem, items: items)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView1()
}


struct ViewPositionKey: PreferenceKey {
    typealias Value = CGRect
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
