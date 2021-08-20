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
    
    let todoId: String?
    
    @Published var todo: Todo?
    @Published var isLoading = false
    @Published var isDone = false
    
    @Injected var todoService: TodosService
    
    private var cancellablesStore = Set<AnyCancellable>()
    
    init(todoId: String?) {
        self.todoId = todoId
    }
    
    func loadTodo() {
        
        guard let id = todoId else {
            return
        }
        
        isLoading = true
        todoService
            .get(id)
            .replaceError(with: nil)
            .sink() { todo in
                self.todo = todo;
                self.isDone = todo != nil ? todo!.isDone : false
                self.isLoading = false
            }
            .store(in: &cancellablesStore)
    }
    
}
