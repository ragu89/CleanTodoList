//
//  TodosService.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import Foundation
import Combine

protocol TodosService {
    
    func fetchTodos() -> Future<[String], Error>;
    
}
