//
//  ContentView.swift
//  WeSplit
//
//  Created by Miguel Piñeiro on 21/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numPeople = 0
    @State private var bill = 0.0
    @State private var tipPercentage = 10
    
    var totalPerPerson: Double {
        let peopleCount = Double(numPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = bill / 100 * tipSelection
        let grandTotal = bill + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    let tipRecommendations = [0, 10, 15, 20, 25]
    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    TextField("Amount", value:$bill, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection:$numPeople){
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much do you want to tip?") {
                    Picker("Select your tip amout", selection: $tipPercentage) {
                        ForEach(tipRecommendations, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Amount per Person") {
                    Text(totalPerPerson, format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
                }
            }
        }
        .navigationTitle("WeSplit")
    }
}

#Preview {
    ContentView()
}
