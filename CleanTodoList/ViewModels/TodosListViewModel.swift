//
//  TodosListViewModel.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import Foundation
import Resolver
import Combine
import FirebaseAnalytics

class TodosListViewModel : ObservableObject {
    
    @Published var todos = [Todo]()
    @Published var isLoading = false
    
    @Injected var todoService: TodosService;
    
    private var cancellablesStore = Set<AnyCancellable>()
    
    init() {
        Analytics.logEvent("TodosListViewModel_init", parameters: nil)
    }
    
    deinit {
        cancellablesStore.forEach() { cancellable in cancellable.cancel() }
    }
    
    func loadTodos() {
        NSLog("TodosListViewModel: loadTodos")
        
        isLoading = true
        todoService
            .fetchTodos()
            .replaceError(with: [Todo]())
            .sink() { todos in
                self.todos = todos;
                self.isLoading = false
            }
            .store(in: &cancellablesStore)
    }
    
}
