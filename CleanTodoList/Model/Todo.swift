//
//  Todo.swift
//  CleanTodoList
//
//  Created by Raphael Guye on 09.08.21.
//

import Foundation
import FirebaseFirestoreSwift

struct Todo : Hashable, Codable {
    
    @DocumentID var id: String?
    let title: String
    let isDone: Bool
    let createdDate: Date
    
    var createdDateFormatted: String {
        get {
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "dd MMM yyyy"
            return dateFormatterPrint.string(from: createdDate)
        }
    }
    
    static func == (a: Todo, b: Todo) -> Bool {
        return a.id == b.id
            && a.title == b.title
            && a.isDone == b.isDone
            && a.createdDate == b.createdDate
    }
}
