//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/19/24.
//

import SwiftUI

/// A view that displays a custom landing animation with rotating banners.
public struct CustomLandingAnimationView: View {

    // MARK: - Properties

    /// The currently selected tab index.
    @State private var currentTab = 0

    /// The height of the TabView.
    @State private var tabViewHeight: CGFloat = 0

    /// A timer to automatically switch tabs.
    private let timer = Timer.publish(every: Constants.tabSwitchInterval, on: .main, in: .common).autoconnect()

    /// The items to display in the landing animation.
    var items: [LandingBannerItem]

    // MARK: - Constants

    private enum Constants {
        static let tabSwitchInterval: TimeInterval = 2.5
        static let additionalHeight: CGFloat = 60
        static let bottomPadding: CGFloat = 40
    }

    // MARK: - Initializer

    /// Initializes a new `CustomLandingAnimationView`.
    ///
    /// - Parameter items: The items to display in the landing animation.
    public init(items: [LandingBannerItem]) {
        self.items = items
    }

    // MARK: - Body

    public var body: some View {
        VStack {
            CustomPagingView(currentIndex: $currentTab, pageCount: items.count) {
                ForEach(0..<items.count, id: \.self) { index in
                    LandingBannerView(image: Image(items[index].image),
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
                .padding(.vertical, 10)
        }
        .onReceive(timer) { _ in
            withAnimation {
                currentTab = (currentTab + 1) % items.count
            }
        }
    }
}
