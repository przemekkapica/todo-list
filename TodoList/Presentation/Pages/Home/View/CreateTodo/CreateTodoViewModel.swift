//
//  CreateTodoViewModel.swift
//  TodoList
//
//  Created by Przemysław Kapica on 05/04/2023.
//

import Foundation

final class CreateTodoViewModel: ObservableObject {
    @Published var bottomSheetPresented = false
    
    private let todoService: TodoService
    
    init(todoService: TodoService = TodoServiceImpl()) {
        self.todoService = todoService
    }
    
    func createTodo(description: String, priority: TodoPriority) {
        self.todoService.createTodo(
            description: description,
            priority: priority
        ) { error in
            if let error = error {
                print(error)
            }
        }
    }
}
