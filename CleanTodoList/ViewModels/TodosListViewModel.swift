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
        
        todoService.todosPublisher
            .assign(to: \.todos, on: self)
            .store(in: &cancellablesStore)
    }
    
    deinit {
        cancellablesStore.forEach() { cancellable in cancellable.cancel() }
    }
    
    func loadTodos() {
        NSLog("TodosListViewModel: loadTodos")
        Analytics.logEvent("TodosListViewModel_loadTodos", parameters: nil)
        todoService.get()
    }
    
}
