//
//  TodosListViewModel.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import Foundation
import Resolver
import Combine

class TodosListViewModel {
    
    @Published var todos: [String]?
    @Injected var todoService: TodosService;
    var cancellablesStore = Set<AnyCancellable>()
    
    init() {
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
