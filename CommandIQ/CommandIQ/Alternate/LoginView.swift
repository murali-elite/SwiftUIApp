//
//  LoginView+Alternate.swift
//  CommandIQ
//
//  Created by Murali moorthy on 7/6/24.
//

import SwiftUI
import UIToolKits

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var location: String = "USA"
    @State var isPasswordHidden: Bool = true

    @State var isPopupPresented = false
    @State var detentHeight: CGFloat = 0
    @State var isScrollable: Bool = false

    var screenHeight = UIScreen.main.bounds.height

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    WelcomeBannerView(title: "Welcome", secondaryTitle: "CommandIQ")
                        .padding(.bottom, 10)

                    LoginTitleView(
                        title:  "Login",
                        subTitle: "Everything you need to secure and control your home network and connected devices."
                    )

                    // Input TextFields
                    VStack(spacing: 30) {
                        TextField("", text: $email)
                            .foregroundStyle(.white)
                            .textFieldViewModifier(title: "Email",
                                                   titleColor: .white,
                                                   tintColor: .white)
                        VStack {
                            PasswordTextFieldView(title: "Password",
                                                  password: $password)
                            Button(action: {
                                isPopupPresented.toggle()
                            }) {
                                ForgotPasswordView(text: "Forgot Password?",
                                                   textColor: .white,
                                                   lineColor: .white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .sheet(isPresented: $isPopupPresented, content: {
                                ForgotPasswordPopUpView()
                                    .readHeight()
                                    .onPreferenceChange(HeightPreferenceKey.self, perform: { height in
                                        if let height = height {
                                            detentHeight = height
                                        }
                                    })
                                    .presentationDetents([.height(detentHeight)])
                                    .presentationDragIndicator(.visible)
                            })
                        }

                        TextField("", text: $location)
                            .foregroundStyle(.white)
                            .dropDownViewModifier(title: "Location",
                                                  titleColor: .white,
                                                  tintColor: .white)
                    }
                    .padding(.vertical)

                    Button("Log In") {
                        //
                    }
                    .foregroundStyle(.blue)
                    .buttonStyleViewModifier(backgroundColor: .white)
                    
                    SignUpButtonView(heading: "Don’t have a Login?",
                                     buttonText: "Sign Up",
                                     headingColor: .white,
                                     buttonTextColor: .white,
                                     borderColor: .white)
                }
                .padding()
            }
            .background(Color("primary"))
        }
    }
}

struct LogInButtonView: View {
    var destination: AnyView? = nil
    var firstButtonText: String
    var secondButtonText: String
    var message: String = ""
    var body: some View {
        VStack {
            Button {
                //
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
                    Button {
                        //
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


struct PasswordTextFieldView1: View {
    @Binding var password: String
    @State var isSecured: Bool = true
    var body: some View {
        VStack {
            if isSecured {
                SecureField("", text: $password)
                    .foregroundStyle(.white)
                    .secureFieldViewModifier(title: "Password",
                                             isTapped: $isSecured,
                                             titleColor: .white,
                                             tintColor: .white)
            } else {
                TextField("", text: $password)
                    .foregroundStyle(.white)
                    .secureFieldViewModifier(title: "Password",
                                             isTapped: $isSecured,
                                             titleColor: .white,
                                             tintColor: .white)
            }
        }
    }
}


#Preview {
    LoginView()
}



public struct DropDownMenuView11<Element: Hashable>: View {
    @State private var selectedIndex: Int?
    let elements: [Element]
    let title: String
    let selectedElement: (Int, Element) -> ()

    public var body: some View {
        Group {
            if #available(iOS 14.0, *) {
                iOS14Menu
            } else {
                legacyPicker
            }
        }
    }
    
    @ViewBuilder
    private var iOS14Menu: some View {
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
    
    @ViewBuilder
    private var legacyPicker: some View {
        Picker(selection: $selectedIndex, label: Text(title)) {
            ForEach(elements.indices, id: \.self) { index in
                Text(String(describing: elements[index]))
                    .font(.system(size: 14))
                    .tag(index)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .onChange(of: selectedIndex) { newIndex in
            if let newIndex = newIndex {
                selectedElement(newIndex, elements[newIndex])
            }
        }
    }
}

struct ContentView11: View {
    var body: some View {
        DropDownMenuView11(
            elements: ["First", "Second", "Third"],
            title: "Select",
            selectedElement: { index, element in
                print("Selected index: \(index), value: \(element)")
            }
        )
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
