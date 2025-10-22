//
//  ContentView.swift
//  WeSplit
//
//  Created by Miguel Piñeiro on 21/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var name = "Harry"
    let students: [String] = ["Harry", "Hermione", "Ron"]
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your favourite Student", selection: $name) {
                    ForEach(students, id:\.self) {
                        Text($0)
                    }
                }
            }
        }
        .navigationTitle("Select Student")
    }
}

#Preview {
    ContentView()
}
