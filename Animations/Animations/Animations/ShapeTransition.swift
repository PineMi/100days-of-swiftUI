//
//  ShapeTransition.swift
//  Animations
//
//  Created by Miguel Piñeiro on 31/10/25.
//

import SwiftUI

struct ShapeTransition: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Click Me") {
            withAnimation {
                enabled.toggle()
            }
        }
        
        if enabled {
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .transition(.scale)
        }
    }
}

#Preview {
    ShapeTransition()
}
