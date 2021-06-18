//
//  Resolver+XCTest.swift
//  CleanTodoListTests
//
//  Created by Guye Raphael, I233 on 18.06.21.
//

import XCTest
import Resolver

extension Resolver {
    
    static var test: Resolver!
    
    static func registerForTesting() {
        Resolver.test = Resolver(parent: main)
        Resolver.root = .test
    }
}
