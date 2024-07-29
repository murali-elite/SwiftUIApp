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
    @State public var isPopupPresented: Bool = false
    
    private var locations: [String] = ["USA", "Canada", "France", "Germany", "Africa"]

    var body: some View {
        NavigationStack {
                VStack(spacing: 10) {
                    WelcomeBannerView(title: "Welcome", secondaryTitle: "CommandIQ")
                        .padding(.bottom, 10)

                    LoginTitleView(
                        title: "Login",
                        subTitle: "Everything you need to secure and control your home network and connected devices."
                    )

                    // Input TextFields
                    LoginContainerView(email: $email,
                                       password: $password,
                                       location: $location,
                                       isPasswordHidden: $isPasswordHidden, isPopupPresented: $isPopupPresented,
                                       locations: locations)
                    
                    
                    
                    // Containe Login, Signup title and Signup Button
                    LoginSignUpButtonContainerView()
                    
                }
                .padding()
                .background(.blue)
            
        }
    }
}

#Preview {
    LoginView()
}
