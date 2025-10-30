//
//  RedScaleButton.swift
//  Animations
//
//  Created by Miguel Piñeiro on 30/10/25.
//

import SwiftUI

struct RedScaleButton: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me") {
            if animationAmount <= 4 {
                animationAmount += 0.5
            } else {
                animationAmount = 1
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .animation(.default, value: animationAmount)
        }
}

#Preview {
    RedScaleButton()
}
