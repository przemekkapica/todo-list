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
    func createTodo(title: String, priority: TodoPriority)
    func deleteTodo(id: String)
    func toggleTodo(id: String, done: Bool)
}

final class TodoServiceImpl: TodoService {
    private let firestore = Firestore.firestore()
    
    func createTodo(title: String, priority: TodoPriority) {
        firestore.collection(TodosCollectionName).addDocument(
            data: [
                "title": title,
                "priority": priority,
                "done": false])
    }
    
    
    func fetchTodos(completion: @escaping ([Todo]) -> Void) {
        firestore.collection(TodosCollectionName).getDocuments { querySnaphot, error in
            if let snapshot = querySnaphot {
                let todos = snapshot.documents.map { document in
                    return Todo(
                        id: document.documentID,
                        title: document["title"] as? String ?? "",
                        done: document["done"] as? Bool ?? false,
                        priority: document["priority"] as? TodoPriority ?? TodoPriority.low)
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


