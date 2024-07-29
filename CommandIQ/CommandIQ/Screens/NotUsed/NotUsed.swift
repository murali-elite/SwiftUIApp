//
//  NotUsed.swift
//  CommandIQ
//
//  Created by Murali moorthy on 7/18/24.
//

import SwiftUI


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

