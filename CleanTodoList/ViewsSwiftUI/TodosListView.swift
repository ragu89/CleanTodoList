//
//  TodosListView.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 13.07.21.
//

import SwiftUI
import Resolver

struct TodosListView: View {
    
    @ObservedObject var viewModel: TodosListViewModel
    
    var body: some View {
        
        content
            .onAppear() {
                viewModel.loadTodos()
            }
            .navigationTitle("Todos list")
        
    }
    
    private var content: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack {
                    VStack {
                        ForEach(viewModel.todos.indices, id: \.self) { todoIndex in
                            createTodoCell(todoIndex: todoIndex)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
    private func createTodoCell(todoIndex: Int) -> some View {
        Group {
            HStack {
                TodoCheckbox(isOn: $viewModel.todos[todoIndex].isDone)
                    .foregroundColor(.black)
                NavigationLink(
                    destination: TodoDetailsView(
                        viewModel: TodoDetailsViewModel(
                            todoId: viewModel.todos[todoIndex].id
                        )
                    ),
                    label: {
                        HStack {
                            Text(viewModel.todos[todoIndex].title)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                        
                    }
                )
            }
            .padding()
            
            Divider()
        }
    }
}

struct TodosListView_Previews: PreviewProvider {
    static var previews: some View {
        TodosListView(viewModel: TodosListViewModel())
    }
}
