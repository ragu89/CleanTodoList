//
//  TodosListViewModel.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import Foundation
import Combine

class TodosListViewModel {
    
    @Published var todos: [String]?
    var cancellablesStore = Set<AnyCancellable>()
    
    init() {
        loadTodos()
            .sink() { todos in
                self.todos = todos;
            }
            .store(in: &cancellablesStore)
    }
    
    deinit {
        cancellablesStore.forEach() { cancellable in cancellable.cancel() }
    }
    
    private func loadTodos() -> Future<[String], Never> {
        return Future() { promise in
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                let todos = ["todo vm 1", "todo vm 2", "todo vm 3"]
                promise(Result.success(todos))
            }
        }
    }
    
}
