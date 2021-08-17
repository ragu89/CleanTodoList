//
//  TodoDetailsView.swift
//  CleanTodoList
//
//  Created by Raphael Guye on 17.08.21.
//

import SwiftUI

struct TodoDetailsView: View {
    
    @ObservedObject var viewModel: TodoDetailsViewModel
    
    var body: some View {
        VStack {
            if viewModel.todo != nil {
                Text(viewModel.todo!.id)
                Text(viewModel.todo!.title)
                Text(viewModel.todo!.isDone ? "Done!" : "Not done yet...")
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Text("Error while loading Todo item")
            }
        }
    }
}

struct TodoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailsView(viewModel: TodoDetailsViewModel(todoId: "test"))
    }
}
