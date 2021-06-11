//
//  TodosList.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import UIKit
import Combine

class TodosListViewController : UITableViewController {
    
    let viewModel: TodosListViewModel
    var cancellablesStore = Set<AnyCancellable>()
    
    init(viewModel: TodosListViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
        
        viewModel.$todos
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellablesStore)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = TodosListViewModel(todoService: FakeTodoService())
        super.init(coder: coder)
    }
    
    deinit {
        cancellablesStore.forEach() { cancellable in cancellable.cancel() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo list"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension TodosListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.todos?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.todos![indexPath.row]
        return cell
    }
    
}
