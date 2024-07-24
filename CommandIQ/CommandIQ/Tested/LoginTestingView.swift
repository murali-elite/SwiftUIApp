//
//  LoginTestingView.swift
//  CommandIQ
//
//  Created by Murali moorthy on 7/24/24.
//

import SwiftUI
import UIToolKits

struct LoginTestingView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var location: String = "USA"
    @State var isPasswordHidden: Bool = true
    
    private var locations: [String] = ["USA", "Canada", "France", "Germany", "Africa"]
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Welcom Banner View") {
                    WelcomeBannerView(title: "Welcome", secondaryTitle: "CommandIQ")
                        .padding()
                        .background(.blue)
                }
                
                NavigationLink("Login Title View") {
                    LoginTitleView(
                        title: "Login",
                        subTitle: "Everything you need to secure and control your home network and connected devices."
                    )
                    .padding()
                    .background(.blue)
                }
                
                NavigationLink("Password Text Field View") {
                    PasswordTextFieldView(title: "Password",
                                          password: $password,
                                          titleColor: .white,
                                          tintColor: .white)
                    .padding()
                    .background(.blue)
                    
                }
                
                NavigationLink("Login Container View") {
                    LoginContainerView(email: $email,
                                       password: $password,
                                       location: $location,
                                       isPasswordHidden: $isPasswordHidden,
                                       locations: locations)
                    .padding()
                    .background(.blue)
                    
                }
                
                NavigationLink("Login Sign Up Button View") {
                    LoginSignUpButtonContainerView()
                        .padding()
                        .background(.blue)
                }
                
                
                NavigationLink("Location Drop Down View") {
                    Text("Location")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .dropDownViewModifier(title: $location,
                                              elements: locations,
                                              textColor: .white,
                                              tintColor: .white) { _, _ in
                        }
                                              .padding()
                                              .background(.blue)
                }
                
                
                
            }
        }
        .navigationTitle("Navigation")
        
    }
}

#Preview {
    LoginTestingView()
}
