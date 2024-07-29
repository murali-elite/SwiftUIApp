//
//  LandingAnimationView.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/18/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A view that displays a landing animation with rotating banners.
public struct LandingAnimationView: View {
    // MARK: - Constants

    private enum Constants {
        static let tabSwitchInterval: TimeInterval = 2.5
        static let additionalHeight: CGFloat = 60
        static let bottomPadding: CGFloat = 40
    }

    // MARK: - Properties

    /// The currently selected tab index.
    @State private var currentTab = 0

    /// The height of the TabView.
    @State private var tabViewHeight: CGFloat = 0

    /// A timer to automatically switch tabs.
    private let timer = Timer.publish(every: Constants.tabSwitchInterval, on: .main, in: .common).autoconnect()

    /// The items to display in the landing animation.
    var items: [LandingBannerItem]

    // MARK: - Body
    /// The content and behavior of the `LandingAnimationView`.
    public var body: some View {
        if #available(iOS 14.0, *) {
            TabView(selection: $currentTab) {
                ForEach(0..<items.count, id: \.self) { index in
                    LandingBannerView(image: items[index].image,
                                      heading: items[index].title,
                                      subHeading: items[index].description)
                    .tag(index)
                    .background(
                        GeometryReader { geometry in
                            Color.clear
                                .onAppear {
                                    self.tabViewHeight = geometry.size.height
                                }
                        }
                    )
                    .padding(.bottom, Constants.bottomPadding)
                }
            }
            .frame(height: tabViewHeight + Constants.additionalHeight)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
            .onReceive(timer) { _ in
                withAnimation {
                    currentTab = (currentTab + 1) % items.count
                }
            }
        } else {
            CustomLandingAnimationView(items: items)
        }
    }

    /// Initializes a new `LandingAnimationView`.
    ///
    /// - Parameter items: The items to display in the landing animation.
    public init(items: [LandingBannerItem]) {
        self.items = items
    }
}






