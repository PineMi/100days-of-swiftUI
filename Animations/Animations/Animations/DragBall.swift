//
//  DragBall.swift
//  Animations
//
//  Created by Miguel Piñeiro on 30/10/25.
//

import SwiftUI

struct DragBall: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.blue, .green], startPoint: .bottomLeading, endPoint: .topTrailing)
            .frame(width: 200, height:200)
            .clipShape(Circle())
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged({ value in self.dragAmount = value.translation })
                    .onEnded({_ in self.dragAmount = CGSize.zero})
            )
            .animation(.spring(duration: 1, bounce: 0.5), value: dragAmount)
        }
}

#Preview {
    DragBall()
}
