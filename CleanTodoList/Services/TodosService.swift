//
//  TodosService.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import Foundation
import Combine

protocol TodosService {
    
    var todosPublisher: Published<[Todo]>.Publisher { get }
    func get()
    
}
