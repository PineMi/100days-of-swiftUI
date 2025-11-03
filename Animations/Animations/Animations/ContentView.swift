//
//  ContentView.swift
//  Animations
//
//  Created by Miguel Piñeiro on 29/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink(destination: RedScaleButton()) {
                    Text("Scale Button")
                }
                
                NavigationLink(destination: ColorPingButton()) {
                    Text("Colorful Button")
                }
                
                NavigationLink(destination: ShapeShifter()) {
                    Text("Shapeshifter")
                }
                
                NavigationLink(destination: AxisRotations()) {
                    Text("Axis Fun")
                }
                
                NavigationLink(destination: DragBall()) {
                    Text("Drag Ball")
                }
                
                NavigationLink(destination: CrazyString()) {
                    Text("Crazy String")
                }
                
                NavigationLink(destination: CardTricks()) {
                    Text("Card Trick")
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
