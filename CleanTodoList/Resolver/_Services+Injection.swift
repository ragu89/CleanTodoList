//
//  _Services+Injection.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 13.06.21.
//

import Foundation

import Resolver

extension Resolver {
    public static func registerServices() {
        register { FakeTodoService() as TodosService }
    }
}
