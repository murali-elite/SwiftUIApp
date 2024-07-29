//
//  LandingBannerItem.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/19/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation

// MARK: - LandingBannerItem

/// A structure representing a banner item for the landing view.
public struct LandingBannerItem {
    // MARK: - Properties

    /// The title of the banner item.
    var title: String

    /// The description of the banner item.
    var description: String

    /// The image name of the banner item.
    var image: String

    // MARK: - Initializer

    /// Initializes a new `LandingBannerItem`.
    ///
    /// - Parameters:
    ///   - title: The title of the banner item.
    ///   - description: The description of the banner item.
    ///   - image: The image name of the banner item.
    public init(title: String, description: String, image: String) {
        self.title = title
        self.description = description
        self.image = image
    }
}


