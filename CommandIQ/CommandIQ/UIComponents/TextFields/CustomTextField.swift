//
//  CustomTextField.swift
//  CommandIQ
//
//  Created by Murali moorthy on 6/16/24.
//

import SwiftUI


@available(iOS 15.0, *)
struct SecureFieldView1: View {
    var placeholder: String = ""
    @State private var isSecure: Bool = true
    @Binding var text: String
    var body: some View {
            HStack {
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .frame(minHeight: 35)
                        .font(.customFont(size: 17, weight: .regular))
                        .tint(.white)
                        .foregroundStyle(.white)
                } else {
                    TextField(placeholder, text: $text)
                        .foregroundStyle(.white)
                        .frame(minHeight: 35)
                        .font(.customFont(size: 17, weight: .regular))
                      
                        
                }
                
                Button(action: {
                    isSecure.toggle()
                }, label: {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                        .foregroundStyle(.white)
                })
            }
            
    }
}



@available(iOS 15.0, *)
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.red)
            .padding()
            .background(.orange)
    }
    
    
}


@available(iOS 15.0, *)
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func waterMark(text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}


@available(iOS 15.0, *)
struct WaterMark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        content
        ZStack {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}
