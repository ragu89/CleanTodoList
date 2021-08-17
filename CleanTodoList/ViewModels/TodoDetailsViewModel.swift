//
//  TodoDetailsViewModel.swift
//  CleanTodoList
//
//  Created by Raphael Guye on 17.08.21.
//

import Foundation
import Resolver
import Combine

class TodoDetailsViewModel : ObservableObject {
    
    @Published var todo: Todo?
    @Published var isLoading = false
    @Published var isDone = false
    
    @Injected var todoService: TodosService
    
    private var cancellablesStore = Set<AnyCancellable>()
    
    init(todoId: String) {
        loadTodo(todoId)
    }
    
    private func loadTodo(_ todoId: String) {
        isLoading = true
        todoService
            .fetchTodo(todoId)
            .replaceError(with: nil)
            .sink() { todo in
                self.todo = todo;
                self.isDone = todo != nil ? todo!.isDone : false
                self.isLoading = false
            }
            .store(in: &cancellablesStore)
    }
    
}
