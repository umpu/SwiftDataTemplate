//
//  Data.swift
//  SwiftDataTemplate
//
//  Created by Andrew Gorbunov on 24.04.2024.
//

import SwiftData

@Model
class Value {
    let string: String
    
    init(string: String) {
        self.string = string
    }
}
