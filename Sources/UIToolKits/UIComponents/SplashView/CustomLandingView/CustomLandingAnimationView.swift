//
//  CustomLandingAnimationView.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/19/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A view that displays a custom landing animation with rotating banners.
public struct CustomLandingAnimationView: View {
    // MARK: - Constants

    private enum Constants {
        static let tabSwitchInterval: TimeInterval = 2.5
        static let additionalHeight: CGFloat = 60
        static let bottomPadding: CGFloat = 40
        static let verticalSpace: CGFloat = 10
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
    /// The content and behavior of the `CustomLandingAnimationView`.
    public var body: some View {
        VStack {
            CustomPagingView(currentIndex: $currentTab, pageCount: items.count) {
                ForEach(0..<items.count, id: \.self) { index in
                    LandingBannerView(image: items[index].image,
                                      heading: items[index].title,
                                      subHeading: items[index].description)
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

            CustomPageIndicator(numberOfPages: items.count, currentIndex: currentTab)
                .padding(.vertical, Constants.verticalSpace)
        }
        .onReceive(timer) { _ in
            withAnimation {
                currentTab = (currentTab + 1) % items.count
            }
        }
    }

    // MARK: - Initializer

    /// Initializes a new `CustomLandingAnimationView`.
    ///
    /// - Parameter items: The items to display in the landing animation.
    public init(items: [LandingBannerItem]) {
        self.items = items
    }
}

