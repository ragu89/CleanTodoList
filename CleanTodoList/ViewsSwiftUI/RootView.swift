//
//  RootView.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 13.07.21.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Text("My Clean TodoApp")
                    .font(.title)
                Text("In SwitUI")
                    .font(.title2)
                
                Spacer()
                Spacer()
         
                NavigationLink(
                    destination:
                        TodosListView(),
                    label: {
                        Text("Open the List view")
                    })
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
