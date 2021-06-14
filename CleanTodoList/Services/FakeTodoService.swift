//
//  FakeTodoService.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import Foundation
import Combine

class FakeTodoService : TodosService {
    
    func fetchTodos() -> Future<[String], Error> {
        NSLog("FakeTodoService: fetchTodos")
        
        return Future() { promise in
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                NSLog("FakeTodoService: fake todos fetched")
                let todos = ["todo vm 1", "todo vm 2", "todo vm 3"]
                promise(Result.success(todos))
            }
        }
    }
    
}
