//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/22/24.
//

import SwiftUI

extension Color {
    init(asset name: String) {
        self.init(name, bundle: Bundle.main)
    }
}

extension Color {
    public static var appPrimaryColor = Color("AppPrimaryColor")
}
