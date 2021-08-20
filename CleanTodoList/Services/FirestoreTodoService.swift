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

            var todos = querySnapshot?.documents.compactMap { document in
              try? document.data(as: Todo.self)
            } ?? []
            todos.sort(by: { todo1, todo2 in
                return todo1.createdDate < todo2.createdDate
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.todos = todos;
            }
          }
    }
    
    func fetchTodos() -> Future<[Todo], Error> {
        return FakeTodoService().fetchTodos()
    }
    
    func fetchTodo(_ todoId: String) -> Future<Todo?, Error> {
        return FakeTodoService().fetchTodo(todoId)
    }
    
}
