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
    
    func get() -> AnyPublisher<[Todo], Error> {
        
        Future<[Todo], Error> { [weak self] promise in
        
            guard let documentName = self?.documentName else {
                promise(.failure(FirestoreError.nilResultError))
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
                
                Thread.sleep(forTimeInterval: 3)
                promise(.success(todos))
              }
        }.eraseToAnyPublisher()
    }
    
    func fetchTodos() -> Future<[Todo], Error> {
        return FakeTodoService().fetchTodos()
    }
    
    func fetchTodo(_ todoId: String) -> Future<Todo?, Error> {
        return FakeTodoService().fetchTodo(todoId)
    }
    
}
enum FirestoreError: Error {
    case nilResultError
}
