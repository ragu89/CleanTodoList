//
//  TodosList.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import UIKit
import Resolver
import Combine

class TodosListViewController : UITableViewController {
    
    @Injected var viewModel: TodosListViewModel
    
    private var cancellablesStore = Set<AnyCancellable>()
    private var activityIndicator: UIActivityIndicatorView!
    
    init() {
        NSLog("TodosListViewController: init")
        super.init(style: .plain)
        
        createComponents()
        
        addSubViews()
        
        applyLayoutConstraint()
        
        registerViewModelBinding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a ViewModel")
    }
    
    deinit {
        cancellablesStore.forEach() { cancellable in cancellable.cancel() }
    }
    
    override func viewDidLoad() {
        NSLog("TodosListViewController: viewDidLoad")
        
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        title = "Todo list"
        viewModel.loadTodos()
    }
    
    private func createComponents() {
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = view.tintColor
    }
    
    private func addSubViews() {
        view.addSubviewIfNotNil(activityIndicator)
    }
    
    private func applyLayoutConstraint() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor)
        ])
    }
    
    private func registerViewModelBinding() {
        
        viewModel.$todos
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellablesStore)
        
        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
            .store(in: &cancellablesStore)
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
