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

    func createTodo(
        description: String,
        priority: TodoPriority,
        completion: @escaping DefaultCompletion
    )
    func deleteTodo(
        id: String,
        completion: @escaping DefaultCompletion
    )
    func toggleTodo(
        id: String,
        done: Bool,
        completion: @escaping DefaultCompletion
    )
}

final class TodoServiceImpl: TodoService {
    private let firestore = Firestore.firestore()
    
    func createTodo(
        description: String,
        priority: TodoPriority,
        completion: @escaping DefaultCompletion
    ) {
        firestore.collection(TodosCollectionName).addDocument(data: [
            "description": description,
            "priority": priority.rawValue,
            "done": false
        ]) { error in
            completion(error)
        }
    }
    
    func fetchTodos(completion: @escaping ([Todo]) -> Void) {
        firestore.collection(TodosCollectionName).getDocuments { querySnaphot, error in
            if let snapshot = querySnaphot {
                var todos = snapshot.documents.map { document in
                    return Todo(
                        id: document.documentID,
                        description: document["description"] as? String ?? "",
                        done: document["done"] as? Bool ?? false,
                        priority: TodoPriority(rawValue: document["priority"] as? String ?? "low") ?? .normal
                    )
                }
                
                todos.sort {
                    $0.priority < $1.priority // sorts by todo priority
                }
                todos.sort {
                    !$0.done && $1.done // sorts by todo done status
                }
                
                completion(todos)
            }
        }
    }
    
    func deleteTodo(id: String, completion: @escaping DefaultCompletion) {
        firestore.collection(TodosCollectionName).document(id).delete { error in
            completion(error)
        }
    }
    
    func toggleTodo(
        id: String,
        done: Bool,
        completion: @escaping DefaultCompletion
    ) {
        firestore
            .collection(TodosCollectionName)
            .document(id)
            .updateData(["done": !done]) { error in
                completion(error)
            }
    }
}



