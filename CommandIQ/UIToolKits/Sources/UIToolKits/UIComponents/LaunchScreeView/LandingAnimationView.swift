//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/18/24.
//

import SwiftUI

// MARK: - LandingBannerItem

/// A structure representing a banner item for the landing view.
public struct LandingBannerItem {
    var title: String
    var description: String
    var image: String

    public init(title: String, description: String, image: String) {
        self.title = title
        self.description = description
        self.image = image
    }
}

/// A view that displays a landing animation with rotating banners.
public struct LandingAnimationView: View {
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

    /// Initializes a new `LandingAnimationView`.
    ///
    /// - Parameter items: The items to display in the landing animation.
    public init(items: [LandingBannerItem]) {
        self.items = items
    }

    // MARK: - Body

    public var body: some View {
        if #available(iOS 14.0, *) {
            TabView(selection: $currentTab) {
                ForEach(0..<items.count, id: \.self) { index in
                    LandingBannerView(image: Image(items[index].image),
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
}
