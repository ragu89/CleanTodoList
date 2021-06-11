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
    
    let todoService: TodosService;
    
    init(todoService: TodosService) {
        self.todoService = todoService
        
        loadTodos()
    }
    
    deinit {
        cancellablesStore.forEach() { cancellable in cancellable.cancel() }
    }
    
    private func loadTodos() {
        todoService
            .fetchTodos()
            .sink() { todos in
                self.todos = todos;
            }
            .store(in: &cancellablesStore)
    }
    
}
