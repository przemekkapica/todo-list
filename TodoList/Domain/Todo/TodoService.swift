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
}

final class TodoServiceImpl: TodoService {
    private let firestore = Firestore.firestore()
    
    func fetchTodos(completion: @escaping ([Todo]) -> Void) {
        firestore.collection(TodosCollectionName).getDocuments { querySnaphot, error in
            if let snapshot = querySnaphot {
                let todos = snapshot.documents.map { document in
                    return Todo(
                        id: document.documentID,
                        title: document["title"] as? String ?? "",
                        done: document["done"] as? Bool ?? false,
                        message: document["message"] as? String ?? "")
                }
                
                completion(todos)
            }
        }
    }
}


