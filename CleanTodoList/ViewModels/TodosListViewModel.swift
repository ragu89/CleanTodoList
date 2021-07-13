//
//  TodosListViewModel.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import Foundation
import Resolver
import Combine

class TodosListViewModel : ObservableObject {
    
    @Published var todos = [String]()
    @Published var isLoading = false
    
    @Injected var todoService: TodosService;
    
    private var cancellablesStore = Set<AnyCancellable>()
    
    deinit {
        cancellablesStore.forEach() { cancellable in cancellable.cancel() }
    }
    
    func loadTodos() {
        NSLog("TodosListViewModel: loadTodos")
        
        isLoading = true
        todoService
            .fetchTodos()
            .replaceError(with: [String]())
            .sink() { todos in
                self.todos = todos;
                self.isLoading = false
            }
            .store(in: &cancellablesStore)
    }
    
}
