//
//  TodosListViewModelTest.swift
//  CleanTodoListTests
//
//  Created by Guye Raphael, I233 on 16.06.21.
//

import XCTest
import Resolver
import Combine

class TodosListViewModelTest: XCTestCase {
    
    private static var cancellablesStore = Set<AnyCancellable>()

    override class func setUp() {
        Resolver.registerForTesting()
    }
    
    override class func tearDown() {
        cancellablesStore.forEach() { cancellable in cancellable.cancel() }
    }
    
    func testInitViewModel() throws {
        
        // Given
        Resolver.test.register { MockTodoService() as TodosService }
        
        // When
        let viewModel = TodosListViewModel()

        // Then
        XCTAssertNotNil(viewModel.todoService)
    }
    
    func testloadTodos() throws {
        
        // Given
        let mockTodoService = MockTodoService()
        Resolver.test.register { mockTodoService as TodosService }
        let viewModel = TodosListViewModel()
        
        let loadTodosExpectation = XCTestExpectation(description: "loadTodosExpectation")
        viewModel.$todos
            .sink { todos in
                XCTAssertNotNil(todos)
                XCTAssertEqual(MockTodoService.todosSource.count, todos!.count)
                loadTodosExpectation.fulfill()
            }
            .store(in: &Self.cancellablesStore)
        
        // When
        viewModel.loadTodos()

        // Then
        wait(for: [loadTodosExpectation], timeout: 0.5)
    }

}
