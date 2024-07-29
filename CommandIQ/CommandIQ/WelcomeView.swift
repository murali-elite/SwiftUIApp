//
//  WelcomeView.swift
//  CommandIQ
//
//  Created by Murali moorthy on 7/3/24.
//

import SwiftUI
import UIToolKits

struct WelcomeView: View {
    @State private var currentTab = 0
    @State private var tabViewHeight: CGFloat = 0
    private let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
    
    let sliderImages = ["globe", "home", "security"]
    private let headings = [
        "Control Your internet and devices",
        "Manage your home",
        "Secure your network"
    ]
    
    private let subHeadings = [
        "View and manage connectivity of all your devices",
        "Group devices by the people who use them or the places they are located",
        "Access your wireless password and view any security settings you have"
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("primary")
                    .ignoresSafeArea()
                
                VStack {
                    WelcomeBannerView(title: "Welcome", secondaryTitle: "CommandIQ")
                    
                    LandingAnimationView(items: [])
                    
                    
                    TabView(selection: $currentTab) {
                        ForEach(0..<sliderImages.count, id: \.self) { index in
                            SlidingBannerImageView(image: Image(sliderImages[index]),
                                                   heading: headings[index],
                                                   subHeading: subHeadings[index])
                            .tag(index)
                            .background(
                                GeometryReader { geometry in
                                    Color.clear
                                        .onAppear {
                                            self.tabViewHeight = geometry.size.height
                                        }
                                }
                            )
                            .padding(.bottom, 40)
                        }
                    }
                    .frame(height: tabViewHeight + 60)
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
                    .onReceive(timer) { _ in
                        withAnimation {
                            currentTab = (currentTab + 1) % sliderImages.count
                        }
                    }
                    
//                    NavigationLink(destination: LoginView(email: "", password: "").navigationBarBackButtonHidden(true)) {
//                    }
//                    
                    Spacer()
                }
                .padding()
            }
        }
    }
    
    
}



struct SlidingBannerImageView: View {
    var image: Image
    var heading: String
    var subHeading: String
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(height: 214)
                .padding(.bottom, 10)
                .frame(alignment: .center)
            
            VStack(spacing: 5) {
                Text(heading)
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(alignment: .center)
                Text(subHeading)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .frame(alignment: .center)
                    .multilineTextAlignment(.center)
                
            }
        }
        .frame(width: 326)
    }
}


#Preview {
    WelcomeView()
}


// MARK: - Preview

struct LandingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LandingAnimationView(items: [])
    }
}


private struct LandingBannerItem {
    var title: String
    var description: String
    var image: Image
}
