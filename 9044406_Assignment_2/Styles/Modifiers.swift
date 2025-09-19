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
            .font(.largeTitle.bold())
            .foregroundColor(Color("AccentColor"))
    }
}

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}

struct TripDetailButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color("AccentColor"))
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct RoundedBorderTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 12)
            .padding(.horizontal, 15)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}

extension View {
    func titleStyle() -> some View { modifier(TitleStyle()) }
    func cardStyle() -> some View { modifier(CardStyle()) }
    func roundedBorderTextFieldStyle() -> some View {
        self.textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

extension ButtonStyle where Self == TripDetailButtonStyle {
    static var tripDetail: TripDetailButtonStyle {
        TripDetailButtonStyle()
    }
}
