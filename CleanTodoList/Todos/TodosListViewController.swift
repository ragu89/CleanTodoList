//
//  TodosList.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import UIKit

class TodosListViewController : UITableViewController {
    
    var todos: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo list"
        
        todos = ["todo 1", "todo 2", "todo 3"]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension TodosListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = todos![indexPath.row]
        return cell
    }
    
}
