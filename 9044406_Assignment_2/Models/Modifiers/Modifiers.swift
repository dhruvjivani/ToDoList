//
//  Modifiers.swift
//  9044406_Assignment_2
//
//  Created by Dhruv Rasikbhai Jivani on 9/18/25.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.bold())
            .foregroundStyle(.primary)
            .padding(.bottom, 6)
    }
}

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.ultraThinMaterial)
                    .shadow(radius: 4)
            )
            .padding(.horizontal)
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(TitleStyle())
    }
    
    func cardStyle() -> some View {
        self.modifier(CardStyle())
    }
}
