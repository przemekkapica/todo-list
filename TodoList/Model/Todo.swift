//
//  Todo.swift
//  TodoList
//
//  Created by Przemysław Kapica on 05/04/2023.
//

import Foundation

enum TodoPriority: String, Equatable, CaseIterable {
    case low = "low"
    case normal = "normal"
    case high = "high"
}

struct Todo: Identifiable {
    var id: String
    var description: String
    var done: Bool
    var priority: TodoPriority
}
