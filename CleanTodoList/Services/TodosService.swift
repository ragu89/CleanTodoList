//
//  TodosService.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import Foundation
import Combine

protocol TodosService {
    
    func fetchTodos() -> Future<[Todo], Error>
    func fetchTodo(_ todoId: String) -> Future<Todo?, Error>
    
}
