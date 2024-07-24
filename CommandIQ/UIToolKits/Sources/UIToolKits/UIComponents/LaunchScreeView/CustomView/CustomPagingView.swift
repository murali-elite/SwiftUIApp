//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/19/24.
//

import SwiftUI

/// A custom view that allows paging through content with a horizontal swipe gesture.
public struct CustomPagingView<Content: View>: View {
    // MARK: - Properties

    /// The current index of the displayed page.
    @Binding var currentIndex: Int

    /// The total number of pages.
    let pageCount: Int

    /// The content to be displayed within the paging view.
    let content: Content

    // MARK: - Constants

    private let swipeThreshold: CGFloat = 50
    private let animationDuration: Double = 0.3

    // MARK: - Initializer

    /// Initializes a new `CustomPagingView`.
    ///
    /// - Parameters:
    ///   - currentIndex: A binding to the current index of the displayed page.
    ///   - pageCount: The total number of pages.
    ///   - content: A view builder that creates the content of the paging view.
    public init(currentIndex: Binding<Int>, pageCount: Int, @ViewBuilder content: () -> Content) {
        self._currentIndex = currentIndex
        self.pageCount = pageCount
        self.content = content()
    }

    // MARK: - Body

    public var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content
                    .frame(width: geometry.size.width)
            }
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
            .animation(.easeIn(duration: animationDuration), value: currentIndex)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < -swipeThreshold, self.currentIndex < self.pageCount - 1 {
                            self.currentIndex += 1
                        } else if value.translation.width > swipeThreshold, self.currentIndex > 0 {
                            self.currentIndex -= 1
                        }
                    }
            )
        }
    }
}
