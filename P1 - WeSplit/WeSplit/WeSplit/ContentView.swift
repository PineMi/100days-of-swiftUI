//
//  ContentView.swift
//  WeSplit
//
//  Created by Miguel Piñeiro on 21/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Enter your Name",text:$name)
            Text("Hello, \(name == "" ? "World" : (name))!")
        }
    }
}

#Preview {
    ContentView()
}
