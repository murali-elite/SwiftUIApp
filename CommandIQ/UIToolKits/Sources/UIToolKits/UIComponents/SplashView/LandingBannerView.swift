//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/18/24.
//

import SwiftUI

/// A view that displays a landing banner with an image, heading, and subheading.
public struct LandingBannerView: View {
    // MARK: - Constants

    private enum Constants {
        static let headingFontSize: CGFloat = 17
        static let subHeadingFontSize: CGFloat = 14
        static let imageHeight: CGFloat = 214
        static let bottomPadding: CGFloat = 10
        static let bannerWidth: CGFloat = 326
        static let verticalSpacing: CGFloat = 5
    }

    // MARK: - Properties

    /// The image to display in the banner.
    var image: Image

    /// The heading text of the banner.
    var heading: String

    /// The subheading text of the banner.
    var subHeading: String

    /// The color of the text in the banner. The default value is `.white`.
    var textColor: Color

    // MARK: - Body

    /// The content and behavior of the `LandingBannerView`.
    public var body: some View {
        VStack {
            image
                .resizable()
                .frame(height: Constants.imageHeight)
                .padding(.bottom, Constants.bottomPadding)
                .frame(alignment: .center)

            VStack(spacing: Constants.verticalSpacing) {
                if #available(iOS 15.0, *) {
                    headingText()
                        .foregroundStyle(textColor)
                    subHeadingText()
                        .foregroundStyle(textColor)
                } else {
                    headingText()
                    subHeadingText()
                }
            }
        }
        .frame(width: Constants.bannerWidth)
    }

    // MARK: - Initializer

    /// Initializes a new instance of the `LandingBannerView`.
    ///
    /// - Parameters:
    ///   - image: The image to display in the banner.
    ///   - heading: The heading text of the banner.
    ///   - subHeading: The subheading text of the banner.
    ///   - textColor: The color of the text in the banner. The default value is `.white`.
    public init(image: Image, heading: String, subHeading: String, textColor: Color = .white) {
        self.image = image
        self.heading = heading
        self.subHeading = subHeading
        self.textColor = textColor
    }

    // MARK: - Private Methods

    /// A view builder for the heading text.
    ///
    /// - Returns: A view that displays the heading text.
    @ViewBuilder
    private func headingText() -> some View {
        Text(heading)
            .font(.system(size: Constants.headingFontSize))
            .fontWeight(.bold)
            .foregroundColor(textColor)
            .frame(alignment: .center)
    }

    /// A view builder for the subheading text.
    ///
    /// - Returns: A view that displays the subheading text.
    @ViewBuilder
    private func subHeadingText() -> some View {
        Text(subHeading)
            .font(.system(size: Constants.subHeadingFontSize))
            .foregroundColor(textColor)
            .frame(alignment: .center)
            .multilineTextAlignment(.center)
    }
}
