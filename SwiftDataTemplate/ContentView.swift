//
//  ContentView.swift
//  SwiftDataTemplate
//
//  Created by Andrew Gorbunov on 24.04.2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query private var values: [Value]
    @Environment (\.modelContext) private var context
    @State private var newString = UUID().uuidString
    
    var body: some View {
        NavigationStack {
            List(values) { value in
                Text(value.string)
            }
        }
        .toolbar {
            Button("Insert Value") {
                let newValue = Value(string: newString)
                context.insert(newValue)
                newString = UUID().uuidString
            }
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Value.self, inMemory: true)
}
