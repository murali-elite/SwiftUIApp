//
//  SwiftUIView.swift
//  
//
//  Created by Murali moorthy on 7/17/24.
//

import SwiftUI

public struct UnderlineModifier: ViewModifier {
    var backgroundColor: Color

    public init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
    }

    public func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(backgroundColor)
                            .offset(x: 0, y: 3)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
                }
            )
    }
}
