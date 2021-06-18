//
//  MockTodosService.swift
//  CleanTodoListTests
//
//  Created by Guye Raphael, I233 on 18.06.21.
//

import Foundation
import Combine

class MockTodoService : TodosService {
    
    func fetchTodos() -> Future<[String], Error> {
        NSLog("FakeTodoService: fetchTodos")
        
        return Future() { promise in
            DispatchQueue.main.async {
                NSLog("MockTodoService: fake todos fetched")
                let todos = ["todo vm 1", "todo vm 2", "todo vm 3"]
                promise(Result.success(todos))
            }
        }
    }
    
}
