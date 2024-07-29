//
//  SampleTestView.swift
//  CommandIQ
//
//  Created by Murali moorthy on 7/25/24.
//

import SwiftUI

struct SampleTestView: View {
    var body: some View {
       
        VStack {
            Button(action: {}, label: {
                Text("Log In")
                    .modifier(ButtonViewModifier())
                    .background(.red)
            })
            
            Button(action: {}, label: {
                Text("Sign Up")
                    .modifier(LabledButtonViewModifier())
                    .background(.red)
            })
            
            Button1(action: {
                
            }, title: "Selected")
            .frame(maxWidth: .infinity, minHeight: 40)
            .background(.orange)
            
            
//            LabledButtonView(title: "Heading 1", buttonTitle: "Heading 2") {
//                print("Tapped")
//            }
//            

            
            
            
           
        }
        .padding()
    }
}













enum RouterStatus: String {
    case success = "success_image"
    case disconnected = "disconnected_image"
    case offline = "offline_image"
    case paused = "paused_image"
    
}

struct RouterImageView: View {
    
    
    var status: RouterStatus
    
    var body: some View {
        HStack {
            Image(systemName: status.rawValue)
                   .frame(width: 50, height: 50)
                   .background(.gray)
                   .clipShape(Circle())
            VStack {
                Text("Jessica")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("online")
                    .foregroundStyle(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
        .padding()
    }
    
}

#Preview {
    RouterImageView(status: .success)
}











struct Button1<Content: View>: View {
    
    let action: () -> Void
    let label: () -> Content
    
    init(action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Content) {
        self.action = action
        self.label = label
    }
    
    init(action: @escaping () -> Void, title: String) where Content == Text {
        
        self.init(action: action, label: {
                Text(title)
        })
    }

    var body: some View {
        VStack {
            Text("Hello")
            label().onTapGesture { action() }
        }
    }
    
}


//struct LabledButtonView<Content: View>: View {
//    var titleContent: Content
//    var buttonContent: Content
//    
//    var title: String
//    var buttonTitle: String
//    
//    var titleForgroundColor: Color
//    var buttonForgroundColor: Color
//    var titleBackgroundColor: Color
//    var buttonBackgroundColor: Color
//    var spacing: CGFloat?
//    let action: () -> Void
//    
//    init(title: String, buttonTitle: String, 
//         titleForgroundColor: Color = .blue,
//         buttonForgroundColor: Color = .blue,
//         titleBackgroundColor: Color = .clear,
//         buttonBackgroundColor: Color = .clear,
//         spacing: CGFloat? = nil,
//         action: @escaping () -> Void) {
//        self.title = title
//        self.buttonTitle = buttonTitle
//        self.titleForgroundColor = titleForgroundColor
//        self.buttonForgroundColor = buttonForgroundColor
//        self.titleBackgroundColor = titleBackgroundColor
//        self.buttonBackgroundColor = buttonBackgroundColor
//        self.spacing = spacing
//        self.action = action
//    }
//    
//    var body: some View {
//        VStack(spacing: spacing) {
//            Text(title)
//                .foregroundStyle(titleForgroundColor)
//                .background(buttonBackgroundColor)
//            Text(buttonTitle)
//                .foregroundStyle(buttonForgroundColor)
//                .background(buttonBackgroundColor)
//                .onTapGesture {
//                    action()
//                }
//        }
//    }
//}



struct LabledButtonViewModifier: ViewModifier {
    
//    var text: String
//    var textColot: Color
//    var font: Font
 
    func body(content: Content) -> some View {
        VStack {
            Text("Don't Have a Account?")
            content
                .frame(maxWidth: .infinity, minHeight: 45)
                .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }
}


struct ButtonViewModifier: ViewModifier {
    
//    var text: String
//    var textColot: Color
//    var font: Font
 
    func body(content: Content) -> some View {
            content
                .frame(maxWidth: .infinity, minHeight: 45)
                .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}
