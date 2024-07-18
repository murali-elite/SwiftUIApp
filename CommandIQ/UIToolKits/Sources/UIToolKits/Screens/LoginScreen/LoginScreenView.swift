//
//  SwiftUIView.swift
//
//
//  Created by Murali moorthy on 7/18/24.
//

import SwiftUI

struct LoginScreenView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var location: String = "USA"
    @State var isPasswordHidden: Bool = true
    
    @State var isPopupPresented = false
    @State var detentHeight: CGFloat = 0
    @State var isScrollable: Bool = false
    
    var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                content
            }
        } else {
            NavigationView {
                content
            }
        }
   
    }
    
    private var content: some View {
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
                    if #available(iOS 15.0, *) {
                        emailTextField()
                            .foregroundStyle(.white)
                    } else {
                        emailTextField()
                    }
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
                        //                            .sheet(isPresented: $isPopupPresented, content: {
                        //                                ForgotPasswordPopUpView()
                        //                                    .readHeight()
                        //                                    .onPreferenceChange(HeightPreferenceKey.self, perform: { height in
                        //                                        if let height = height {
                        //                                            detentHeight = height
                        //                                        }
                        //                                    })
                        //                                    .presentationDetents([.height(detentHeight)])
                        //                                    .presentationDragIndicator(.visible)
                        //                            })
                    }
                    
                    if #available(iOS 15.0, *) {
                        locationTextField()
                            .foregroundStyle(.white)
                    } else {
                        locationTextField()
                    }
                }
                .padding(.vertical)
                
                
                if #available(iOS 15.0, *) {
                    loginButtonView()
                        .foregroundStyle(.white)
                } else {
                    loginButtonView()
                }
                
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
    
    @ViewBuilder
    private func emailTextField() -> some View {
        TextField("", text: $email)
            .foregroundColor(.white)
            .textFieldViewModifier(title: "Email",
                                   titleColor: .white,
                                   tintColor: .white)
    }
    
    
    @ViewBuilder
    private func locationTextField() -> some View {
        TextField("", text: $location)
            .foregroundColor(.white)
            .dropDownViewModifier(title: "Location",
                                  titleColor: .white,
                                  tintColor: .white)
    }
    
    @ViewBuilder
    private func loginButtonView() -> some View {
        Button("Log In") {
            //
        }
        .foregroundColor(.blue)
        .buttonStyleViewModifier(backgroundColor: .white)
    }
}

#Preview {
    LoginScreenView()
}


