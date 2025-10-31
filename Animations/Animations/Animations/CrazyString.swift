//
//  CrazyString.swift
//  Animations
//
//  Created by Miguel Piñeiro on 31/10/25.
//

import SwiftUI

struct CrazyString: View {
    let letters = Array("Swift is Fun!")
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0){
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .red : .blue )
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num)/20), value: dragAmount)
            }
        }
        .gesture(DragGesture()
            .onChanged {
                dragAmount = $0.translation
                enabled = true
            }
            .onEnded { _ in
                dragAmount = .zero
                enabled.toggle()
            }
        )
    }
}

#Preview {
    CrazyString()
}
