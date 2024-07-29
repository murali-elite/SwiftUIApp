//
//  LoginTitleAsstesProtocol.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/25/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A protocol that defines the properties for the title assets in a login view.
public protocol LoginTitleAsstesProtocol {
    /// The color of the header text.
    var headerTextColor: Color { get set }

    /// The color of the subheading text.
    var subHeadingTextColor: Color { get set }

    /// The font used for the header text.
    var headingFont: Font { get set }

    /// The font used for the subheading text.
    var subHeadingFont: Font { get set }
}
