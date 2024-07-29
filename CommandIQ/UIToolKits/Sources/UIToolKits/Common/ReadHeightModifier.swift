//
//  ReadHeightModifier.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/15/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

internal struct ReadHeightModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
    }

    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}
