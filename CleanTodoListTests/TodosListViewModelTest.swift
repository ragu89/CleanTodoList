//
//  TodosListViewModelTest.swift
//  CleanTodoListTests
//
//  Created by Guye Raphael, I233 on 16.06.21.
//

import XCTest
import Resolver

class TodosListViewModelTest: XCTestCase {

    override class func setUp() {
        Resolver.registerForTesting()
    }
    
    func testInitViewModel() throws {
        
        // Given
        Resolver.test.register { MockTodoService() as TodosService }
        
        // When
        let viewModel = TodosListViewModel()

        // Then
        XCTAssertNotNil(viewModel.todoService)
    }

}
