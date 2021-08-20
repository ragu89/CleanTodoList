//
//  TodoCheckbox.swift
//  CleanTodoList
//
//  Created by Raphael Guye on 17.08.21.
//

import SwiftUI

struct TodoCheckbox: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        
        Button(action: {
            self.isOn.toggle()
        }, label: {
            isOn ?
                Image(systemName: "checkmark.rectangle") :
                Image(systemName: "rectangle")
        })
    }
}

struct TodoCheckbox_Previews: PreviewProvider {
    @State static var isOn = false
    static var previews: some View {
        TodoCheckbox(isOn: $isOn)
    }
}
