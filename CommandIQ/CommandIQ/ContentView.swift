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
            Color("primary")
                .ignoresSafeArea()
            VStack {
                WelcomeBannerView(title: "", secondaryTitle: "")
                Spacer()
            }
            .padding()
            
        }
        
    }
}

#Preview {
    ContentView()
}
