//
//  MockTodosService.swift
//  CleanTodoListTests
//
//  Created by Guye Raphael, I233 on 18.06.21.
//

import Foundation
import Combine

class MockTodoService : TodosService {
    
    static let todosSource = ["todo vm 1", "todo vm 2", "todo vm 3"]
    
    func fetchTodos() -> Future<[String], Error> {
        
        return Future() { promise in
            NSLog("MockTodoService: fake todos fetched")
            let todos = MockTodoService.todosSource
            promise(Result.success(todos))
        }
    }
    
}

class MockErrorTodoService : TodosService {
    
    func fetchTodos() -> Future<[String], Error> {
        
        return Future() { promise in
            NSLog("MockErrorTodoService: simulate an error")
            promise(Result.failure(MockError.fakeError))
        }
    }
}

enum MockError : Error {
    case fakeError
}
