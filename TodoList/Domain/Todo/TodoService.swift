//
//  TodoService.swift
//  TodoList
//
//  Created by Przemysław Kapica on 05/04/2023.
//

import Foundation
import FirebaseFirestore

let TodosCollectionName = "todos"

protocol TodoService {
    func fetchTodos(completion: @escaping ([Todo]) -> Void)
    func createTodo(description: String, priority: TodoPriority)
    func deleteTodo(id: String)
    func toggleTodo(id: String, done: Bool)
}

final class TodoServiceImpl: TodoService {
    private let firestore = Firestore.firestore()
    
    func createTodo(description: String, priority: TodoPriority) {
        firestore.collection(TodosCollectionName).addDocument(
            data: [
                "description": description,
                "priority": priority.rawValue,
                "done": false])
    }
    
    
    func fetchTodos(completion: @escaping ([Todo]) -> Void) {
        firestore.collection(TodosCollectionName).getDocuments { querySnaphot, error in
            if let snapshot = querySnaphot {
                var todos = snapshot.documents.map { document in
                    return Todo(
                        id: document.documentID,
                        description: document["description"] as? String ?? "",
                        done: document["done"] as? Bool ?? false,
                        priority: document["priority"] as? TodoPriority ?? TodoPriority.low)
                }
                
                todos.sort {
                    $0.priority == TodoPriority.high && $1.priority == TodoPriority.normal
                }
                todos.sort {
                    !$0.done && $1.done
                }
                
                completion(todos)
            }
        }
    }
    
    func deleteTodo(id: String) {
        firestore.collection(TodosCollectionName).document(id).delete() { error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func toggleTodo(id: String, done: Bool) {
        firestore
            .collection(TodosCollectionName)
            .document(id)
            .updateData(["done": !done]) { error in
                if let error = error {
                    print(error)
            }
        }
    }
}


