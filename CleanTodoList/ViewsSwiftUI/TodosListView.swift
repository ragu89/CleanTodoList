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
        ZStack {
            
            List(viewModel.todos, id: \.self) { todo in
                VStack(alignment: .leading) {
                    Text(todo.title)
                    Text(todo.createdDateFormatted)
                        .font(.caption)
                }.padding(4)
            }.listStyle(InsetGroupedListStyle())
            
            if viewModel.isLoading {
                ProgressView()
            }
            
        }
        .onAppear() {
            viewModel.loadTodos()
        }
    }
}

struct TodosListView_Previews: PreviewProvider {
    static var previews: some View {
        TodosListView(viewModel: TodosListViewModel())
    }
}
