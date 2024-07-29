//
//  LoginContainerAssetsProtocol.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/24/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// Protocol defining the assets for a login container, such as colors.
public protocol LoginContainerAssetsProtocol {
    /// The color of the heading text.
    var headingTextColor: Color { get set }

    /// The color used for tints.
    var tintColor: Color { get set }

    /// The font used for the heading text.
    var headingFont: Font { get set }

    /// The font used for the input fields.
    var inputFieldFont: Font { get set }

    /// The font used for the forgot password text.
    var forgotPasswordFont: Font { get set }
}
