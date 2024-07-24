//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/19/24.
//

import SwiftUI

/// A view that displays a custom page indicator for a given number of pages and current index.
public struct CustomPageIndicator: View {
    // MARK: - Properties

    /// The total number of pages.
    let numberOfPages: Int

    /// The current selected index.
    var currentIndex: Int

    // MARK: - Constants

    private enum Constants {
        static let circleSize: CGFloat = 8
        static let spacing: CGFloat = 8
    }

    // MARK: - Body

    public var body: some View {
        HStack(spacing: Constants.spacing) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(index == self.currentIndex ? Color.primary : Color.secondary)
                    .frame(width: Constants.circleSize, height: Constants.circleSize)
            }
        }
    }
}
