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
    
    @Published var todos: [Todo] = []
    var todosPublisher: Published<[Todo]>.Publisher { $todos }
    
    let documentName = "todos"
    
    func get() {
        Firestore.firestore().collection(documentName)
          .addSnapshotListener { querySnapshot, error in
            if let error = error {
              print("Error getting todo items: \(error.localizedDescription)")
              return
            }

            self.todos = querySnapshot?.documents.compactMap { document in
              try? document.data(as: Todo.self)
            } ?? []
          }
    }
    
}
