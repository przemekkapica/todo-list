//
//  HomeViewModel.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var bottomSheetPresented = false
    
    private let todoService: TodoService
    
    init(todoService: TodoService = TodoServiceImpl()) {
        self.todoService = todoService
    }
    
    func fetchTodos() {
        todoService.fetchTodos { [weak self] todos in
            self?.todos = todos
        }
    }
}
