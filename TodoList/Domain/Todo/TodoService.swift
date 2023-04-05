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
    func createTodo(title: String, notes: String?)
}

final class TodoServiceImpl: TodoService {
    func createTodo(title: String, notes: String?) {
        firestore.collection(TodosCollectionName).addDocument(data: ["title": title, "notes": notes])
    }
    
    private let firestore = Firestore.firestore()
    
    func fetchTodos(completion: @escaping ([Todo]) -> Void) {
        firestore.collection(TodosCollectionName).getDocuments { querySnaphot, error in
            if let snapshot = querySnaphot {
                let todos = snapshot.documents.map { document in
                    return Todo(
                        id: document.documentID,
                        title: document["title"] as? String ?? "",
                        done: document["done"] as? Bool ?? false,
                        message: document["notes"] as? String ?? "")
                }
                
                completion(todos)
            }
        }
    }
}


