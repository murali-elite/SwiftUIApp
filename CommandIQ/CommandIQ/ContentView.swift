//
//  ContentView.swift
//  CommandIQ
//
//  Created by Murali moorthy on 6/15/24.
//

import SwiftUI
import UIToolKits

struct ContentView: View {
    var body: some View {
        ZStack {
            
            VStack {
               // WelcomeBannerView(title: "", secondaryTitle: "")
                LoginTitleView(title: "Hello", subTitle: "Hello")
                   
               // Spacer()
            }
            .padding()
            
        }
        
    }
}


#Preview {
    ContentView()
}
