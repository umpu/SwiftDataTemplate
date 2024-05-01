//
//  SwiftDataTemplateApp.swift
//  SwiftDataTemplate
//
//  Created by Andrew Gorbunov on 24.04.2024.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataTemplateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Value.self, isUndoEnabled: true)
        }
    }
}
