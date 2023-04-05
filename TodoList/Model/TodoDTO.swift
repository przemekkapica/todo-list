//
//  Todo.swift
//  TodoList
//
//  Created by Przemysław Kapica on 05/04/2023.
//

import Foundation

struct Todo: Identifiable {
    var id: String
    var title: String
    var done: Bool
    var message: String?
}
