//
//  Font.swift
//  CommandIQ
//
//  Created by Murali moorthy on 6/19/24.
//

import Foundation
import SwiftUI


enum FontStyle: String {
    case regular = "OpenSans"
    case medium = "OpenSans-Medium"
    case semibold = "OpenSans-SemiBold"
    case bold = "OpenSans-Bold"
    case light = "OpenSans-Light"
}

extension Font {
    
    /// Choose your font to set up
    /// - Parameters:
    ///   - style: Make sure the style is available
    ///   - size: Use prepared sizes for your app
    /// - Returns: Font ready to show
    static func customFont(
        size: CGFloat,
        weight: FontStyle) -> Font {
            let fontName: String = weight.rawValue
            let font = Font.custom(fontName, size: size)
            return font
        }
}
