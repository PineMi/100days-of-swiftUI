//
//  ContentView.swift
//  WeSplit
//
//  Created by Miguel Piñeiro on 21/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var taps = 0
    
    var body: some View {
        Button("Tap Count Up! \(taps)") {
            taps += 1
        }
    }
}

#Preview {
    ContentView()
}
