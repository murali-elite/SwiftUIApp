//
//  SignUpView.swift
//  CommandIQ
//
//  Created by Murali moorthy on 7/7/24.
//

import SwiftUI
import UIToolKits

@available(iOS 15.0, *)
struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var location: String = "USA"
    
    @State private var selection = "Red"
        let colors = ["Red", "Green", "Blue", "Black", "Tartan"]
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 10) {
                WelcomeBannerView(title: "Welcome", secondaryTitle: "CommandIQ")
                    .padding(.bottom, 10)
                Text("Sign Up")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                
                // Input TextFields
                VStack(spacing: 30) {
                    TextField("", text: $firstName)
                        .foregroundStyle(.white)
                        .textFieldViewModifier(title: "First Name",
                                               tintColor: .white)
                    TextField("", text: $lastName)
                        .foregroundStyle(.white)
                        .textFieldViewModifier(title: "Last Name",
                                               tintColor: .white)
                    TextField("", text: $email)
                        .foregroundStyle(.white)
                        .textFieldViewModifier(title: "Email",
                                               tintColor: .white)
                   
                    PasswordTextFieldView(title: "Password",
                                          password: $password)
                    
                    TextField("", text: $location)
                        .foregroundStyle(.white)
                        .dropDownViewModifier(title: $location, elements: colors) { _, _ in
                            
                        }
                    
                    Picker("Select a paint color", selection: $selection) {
                                    ForEach(colors, id: \.self) {
                                        Text($0)
                                    }
                                }
                    .pickerStyle(.automatic)
                }
                .padding(.vertical)
                
                // Button
                SignUpBottomButtonView(buttonAction: { dismiss() },
                                 firstButtonText: "Sign Up",
                                      secondButtonText: "Log In",
                                      message: "Already registered?")
            }
            .padding()
        }
        .background(Color("primary"))
    }
}

@available(iOS 15.0, *)
struct SignUpBottomButtonView: View {
    var buttonAction: (()->Void)
    var destination: AnyView? = nil
    var firstButtonText: String
    var secondButtonText: String
    var message: String = ""
    var body: some View {
        VStack {
            Button {
              
            } label: {
                HStack {
                    Text(firstButtonText)
                        .buttonStyleViewModifier(backgroundColor: .white)
                        .foregroundStyle(.blue)
                        .padding(.bottom, 10)
                }
            }
            VStack {
                Text(message)
                    .font(.customFont(size: 15, weight: .regular))
                    .foregroundStyle(.white)
                if let destination = destination {
                    NavigationLink(destination: destination.navigationBarBackButtonHidden()) {
                        Text(secondButtonText)
                            .frame(maxWidth: .infinity)
                            .buttonStyleViewModifier(borderColor: .white)
                            .foregroundStyle(.white)
                    }
                } else {
                    Button {
                        buttonAction()
                    } label: {
                        Text(secondButtonText)
                            .frame(maxWidth: .infinity)
                            .buttonStyleViewModifier(borderColor: .white)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}


#Preview {
    SignUpView()
}

//
//struct DropDownMenus<Element: Hashable>: View {
//    @State private var selectedIndex: Int?
//    let elements: [Element]
//    let title: String
//    let selectedElement: (Int, Element) -> ()
//    
//    var body: some View {
//        Menu(selectedIndex == nil ? title : "\(elements[selectedIndex!])") {
//            ForEach(elements.indices.reversed(), id: \.self) { index in
//                Button(action: {
//                    selectedIndex = index
//                    selectedElement(index, elements[index])
//                }) {
//                    Text(String(describing: elements[index]))
//                        .font(.system(size: 14))
//                }
//            }
//        }
//    }
//}
//
//#Preview{
//    DropDownMenus(elements: ["First", "Second", "Third"], title: "Hello") { index, element in
//        print("Selected", index, element)
//    }
//}
