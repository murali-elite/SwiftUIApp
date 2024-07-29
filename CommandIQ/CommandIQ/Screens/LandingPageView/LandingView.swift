//
//  LandingView.swift
//  CommandIQ
//
//  Created by Murali moorthy on 7/22/24.
//

import SwiftUI
import UIToolKits

struct Country {
    var id: Int
    var name: String
}

struct LandingView: View {
    
    @State var location: String = "USA"
    @State var isPasswordHidden: Bool = true
    
    @State var selectedItem: String = ""
    @State var selectedIndex: Int = 0
    
    @State var countrys: [Country] = [
        Country(id: 0, name: "USA"),
        Country(id: 1, name: "Canada"),
        Country(id: 2, name: "France"),
        Country(id: 3, name: "Germany"),
        Country(id: 4, name: "Africa")
    ]
    
    private var locations: [String] = ["USA", "Canada", "France", "Germany", "Africa"]
    
    @State var title: String = ""
    
    var colors = ["Red", "Green", "Blue", "Tartan"]
      @State private var selectedColor = "Red"
    
    
    private let bannerItems: [LandingBannerItem] = [
        LandingBannerItem(title: "Control Your internet and devices",
                          description: "View and manage connectivity of all your devices",
                          image: "Landing_Global_Image"),
        LandingBannerItem(title: "Manage your home",
                          description: "Group devices by the people who use them or the places they are located",
                          image: "Landing_Home_Image"),
        LandingBannerItem(title: "Secure your network",
                          description: "Access your wireless password and view any security settings you have",
                          image: "Landing_Security_Image")
    ]
    var body: some View {
        VStack {
            WelcomeBannerView(title: "Welcome",
                              secondaryTitle: "CommandIQ")
                .padding(.bottom, 10)
            LandingAnimationView(items: bannerItems)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AppPrimaryColor"))
        
        
        VStack {
            Picker("", selection: $selectedColor) {
                ForEach(colors, id: \.self) { color in
                    Text(color)
                }
            }
            .foregroundColor(.black)
            .pickerStyle(MenuPickerStyle())
            Text("You selected: \(selectedColor)")
        }
        
    }
}



#Preview {
    LandingView()
}
