//
//  HeightPreferenceKey.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/10/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A preference key for storing and retrieving a preferred height value.
public struct HeightPreferenceKey: PreferenceKey {
    /// The default value for the height preference key.
    public static var defaultValue: CGFloat?

    /// Reduces the preference values.
    ///
    /// - Parameters:
    ///   - value: The current value of the preference.
    ///   - nextValue: A closure that provides the next value of the preference.
    public static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
}
