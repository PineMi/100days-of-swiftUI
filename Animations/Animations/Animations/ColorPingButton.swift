//
//  ColorPingButton.swift
//  Animations
//
//  Created by Miguel Piñeiro on 30/10/25.
//

import SwiftUI

struct ColorPingButton: View {
    @State private var animationAmount = 1.0
    @State private var colorIndex = 0
    let colorList: [Color] = [.red, .blue, .yellow, .green, .orange, .black, .gray, .indigo, .pink, .cyan, .mint, .purple]
    var body: some View {
        Button("Tap Me") {
            if colorIndex < colorList.count - 1 {
                colorIndex += 1
            } else {
                colorIndex = 0

            }
            
        }
        .padding(50)
        .background(colorList[colorIndex])
        .foregroundStyle(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(colorList[colorIndex])
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

#Preview {
    ColorPingButton()
}
