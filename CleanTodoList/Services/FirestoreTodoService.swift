//
//  FirestoreTodoService.swift
//  CleanTodoList
//
//  Created by Raphael Guye on 15.08.21.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirestoreTodosService : TodosService, ObservableObject {
    
    let documentName = "todos"
    
    func getAll() -> AnyPublisher<[Todo], Error> {
        
        Future<[Todo], Error> { [weak self] promise in
        
            guard let documentName = self?.documentName else {
                promise(.failure(FirestoreError.unexpectedError))
                return
            }
            
            Firestore.firestore().collection(documentName)
                .addSnapshotListener { querySnapshot, error in
                
                    if let error = error {
                      print("Error getting todo items: \(error.localizedDescription)")
                      return
                    }

                    var todos = querySnapshot?.documents.compactMap { document in
                        try? document.data(as: Todo.self)
                    } ?? []
                    todos.sort(by: { todo1, todo2 in
                        return todo1.createdDate < todo2.createdDate
                    })
                    
                    Thread.sleep(forTimeInterval: 1.5) // Simulate a long loading...
                    promise(.success(todos))
                }
        }.eraseToAnyPublisher()
    }
    
    func get(_ todoId: String) -> AnyPublisher<Todo?, Error> {
        
        Future<Todo?, Error> { [weak self] promise in
            
            guard let documentName = self?.documentName else {
                promise(.failure(FirestoreError.unexpectedError))
                return
            }
            
            Firestore.firestore()
                .collection(documentName)
                .document(todoId)
                .addSnapshotListener { querySnapshot, error in
                    
                    if let error = error {
                        print("Error getting todo items: \(error.localizedDescription)")
                        promise(.failure(FirestoreError.serverError))
                        return
                    }

                    Thread.sleep(forTimeInterval: 1.5) // Simulate a long loading...
                    if let todo = try? querySnapshot?.data(as: Todo.self) {
                        promise(.success(todo))
                    } else {
                        promise(.failure(FirestoreError.itemNotFound))
                    }
                }
        }.eraseToAnyPublisher()
    }
}

enum FirestoreError: Error {
    case serverError
    case unexpectedError
    case itemNotFound
}
