//
//  AxisRotations.swift
//  Animations
//
//  Created by Miguel Piñeiro on 30/10/25.
//

import SwiftUI

struct AxisRotations: View {
    @State private var rotationAmount = 0.0
    var body: some View {
        VStack {
            
            // X Axis
            Button {
                withAnimation(.spring(duration: 1, bounce: 0.5)){
                    rotationAmount += 360
                }
                rotationAmount = 0
            } label: {
                Text("- X -").bold()
            }
            .padding(50)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(rotationAmount), axis:(x: 1,y: 0,z: 0))
            
            // Y Axis
            Button {
                withAnimation(.spring(duration: 1, bounce: 0.5)){
                    rotationAmount += 360
                }
                rotationAmount = 0
            } label: {
                Text("|\nY\n|").bold()
            }
            .padding(50)
            .background(.green)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(rotationAmount), axis:(x: 0,y: 1,z: 0))
            
            // Z Axis
            Button {
                withAnimation(.spring(duration: 1, bounce: 0.5)){
                    rotationAmount += 360
                }
                rotationAmount = 0
            } label: {
                Text("Z\n.\n").bold()
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(rotationAmount), axis:(x: 0,y: 0,z: 1))
            
            Slider(value: $rotationAmount, in: 0...360)
                .padding(.horizontal)
                .offset(y: 100)
    
        }
    }
}

#Preview {
    AxisRotations()
}
