//
//  Todo.swift
//  CleanTodoList
//
//  Created by Raphael Guye on 09.08.21.
//

import Foundation

struct Todo : Hashable {
    
    let id: String
    let title: String
    let isDone: Bool
    
    static func == (a: Todo, b: Todo) -> Bool {
        return a.id == b.id
            && a.title == b.title
            && a.isDone == b.isDone
    }
}