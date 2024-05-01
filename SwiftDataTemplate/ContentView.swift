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
    @Environment (\.undoManager) private var undoManager
    @State private var newString = UUID().uuidString
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(values, id: \.self) { value in
                    Text(value.string)
                }
                .onDelete(perform: deleteValue)
            }
            .toolbar {
                ToolbarItemGroup {
                    Button("Undo", systemImage: "arrow.uturn.backward") { undoManager?.undo() }
                    Button("Redo", systemImage: "arrow.uturn.forward") { undoManager?.redo() }
                    Button("Insert", systemImage: "plus") {
                        let newValue = Value(string: newString)
                        context.insert(newValue)
                        newString = UUID().uuidString
                    }
                    EditButton()
                }
            }
            .animation(.default, value: values)
        }
    }
    
    func deleteValue(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let value = values[offset]
            
            // delete it from the context
            context.delete(value)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Value.self, inMemory: true, isUndoEnabled: true)
}
