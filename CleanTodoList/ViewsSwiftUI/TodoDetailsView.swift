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
        if viewModel.todo != nil {
            loadedView
        } else if viewModel.isLoading {
            ProgressView()
        } else {
            Text("Error while loading Todo item")
        }
    }
    
    var loadedView: some View {
        VStack {
            Text(viewModel.todo!.id)
            Text(viewModel.todo!.title)
            TodoCheckbox(isOn: $viewModel.isDone)
        }
    }
}

struct TodoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailsView(viewModel: TodoDetailsViewModel(todoId: "test"))
    }
}
