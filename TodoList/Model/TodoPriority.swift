//
//  TodoPriority.swift
//  TodoList
//
//  Created by Przemysław Kapica on 06/04/2023.
//

import Foundation

enum TodoPriority: String, Equatable, CaseIterable {
    case low = "low"
    case normal = "normal"
    case high = "high"
}

extension TodoPriority {
    private var sortOrder: Int {
        switch self {
        case .low:
            return 2
        case .normal:
            return 1
        case .high:
            return 0
        }
    }
    
    static func ==(t1: TodoPriority, t2: TodoPriority) -> Bool {
        return t1.sortOrder == t2.sortOrder
    }
    
    static func <(t1: TodoPriority, t2: TodoPriority) -> Bool {
        return t1.sortOrder < t2.sortOrder
    }
}
