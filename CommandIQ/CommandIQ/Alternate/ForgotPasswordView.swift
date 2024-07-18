//
//  ForgotPasswordView.swift
//  CommandIQ
//
//  Created by Murali moorthy on 7/9/24.
//

import SwiftUI
import UIToolKits

struct ForgotPasswordPopUpView: View {
    @State var isScrollable: Bool = false
    @State var email: String = ""
    @State var location: String = "USA"
    @State var contentHeight: CGFloat = 0
    var body: some View {
       // ScrollView(isScrollable ? .vertical : []) {
            
            VStack {
                VStack(spacing: 10) {
                    Text("Reset Password")
                        .font(.system(size: 18))
                    Text("Enter your email address and choose your location to reset the password")
                        .font(.system(size: 17))
                        .foregroundStyle(.black.opacity(0.6))
                    
                }
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                
                VStack(spacing: 20) {
                    TextField("", text: $email)
                        .foregroundStyle(.white)
                        .textFieldViewModifier(title: "Email",
                                               tintColor: .gray.opacity(0.5))
                    TextField("", text: $location)
                        .foregroundStyle(.black)
                        .dropDownViewModifier(title: "Location",
                                              tintColor: .gray.opacity(0.5))
                }
                .padding(.bottom, 20)
                
                VStack(spacing: 20) {
                    Button {
                        
                    } label: {
                        HStack {
                            Text("Submit")
                                .buttonStyleViewModifier(backgroundColor: .blue)
                                .foregroundStyle(.white)
                                
                        }
                        
                    }
                        Button {
                            
                        } label: {
                            Text("Cancel")
                                .buttonStyleViewModifier(borderColor: .blue)
                                .foregroundStyle(.blue)
                            
                            
                    }
                }
                
                
            }
//            .background(GeometryReader {
//                Color.clear.preference(key: HeightPreferenceKey.self, value: $0.frame(in: .local).size.height)
//            })
//            .onPreferenceChange(HeightPreferenceKey.self) { height in
//                contentHeight = height!
//                isScrollable = contentHeight > (UIScreen.main.bounds.height - 200)
//            }
            .padding()
       // }
    }
}

#Preview {
    ForgotPasswordPopUpView(isScrollable: false)
  
}


/*
struct DropdownOption: Hashable {
    let key: String
    let value: String

    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}

struct DropdownRow: View {
    var option: DropdownOption
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        Button(action: {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text(self.option.value)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}

struct Dropdown: View {
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                }
            }
        }
        .frame(minHeight: CGFloat(options.count) * 30, maxHeight: 250)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct DropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selectedOption: DropdownOption? = nil
    var placeholder: String
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    private let buttonHeight: CGFloat = 45

    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.value)
                    .font(.system(size: 14))
                    .foregroundColor(selectedOption == nil ? Color.gray: Color.black)

                Spacer()

                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 9, height: 5)
                    .font(Font.system(size: 9, weight: .medium))
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(width: .infinity, height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onOptionSelected: { option in
                        shouldShowDropdown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                }
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: 5).fill(Color.white)
        )
    }
}

struct DropdownSelector_Previews: PreviewProvider {
    @State private static var address: String = ""

    static var uniqueKey: String {
        UUID().uuidString
    }

    static let options: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Sunday"),
        DropdownOption(key: uniqueKey, value: "Monday"),
        DropdownOption(key: uniqueKey, value: "Tuesday"),
        DropdownOption(key: uniqueKey, value: "Wednesday"),
        DropdownOption(key: uniqueKey, value: "Thursday"),
        DropdownOption(key: uniqueKey, value: "Friday"),
        DropdownOption(key: uniqueKey, value: "Saturday")
    ]


    static var previews: some View {
        VStack(spacing: 20) {
            DropdownSelector(
                placeholder: "Day of the week",
                options: options,
                onOptionSelected: { option in
                    print(option)
            })
            .padding(.horizontal)
            .zIndex(1)

            Group {
                TextField("Full Address", text: $address)
                    .font(.system(size: 14))
                    .padding(.horizontal)
            }
            .frame(width: .infinity, height: 45)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal)
        }
    }
}
*/

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
