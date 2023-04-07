//
//  HomeViewModel.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var bottomSheetPresented = false
    @Published var showErrorToast = false
    
    private let todoService: TodoService
    
    init(todoService: TodoService = TodoServiceImpl()) {
        self.todoService = todoService
    }
    
    func fetchTodos() {
        todoService.fetchTodos { [weak self] todos in
            self?.todos = todos
        }
    }
    
    func deleteTodo(indexSet: IndexSet) {
        let id = indexSet.map {
            self.todos[$0].id
        }[0]
        
        self.todoService.deleteTodo(id: id) { error in
            if let error = error {
                self.showErrorToast = true
                print(error)
            } else {
                self.fetchTodos()
            }
        }
    }
    
    func toggleTodo(todo: Todo) {
        todoService.toggleTodo(id: todo.id, done: todo.done) { error in
            if let error = error {
                self.showErrorToast = true
                print(error)
            } else {
                self.fetchTodos()
            }
        }
    }
}
