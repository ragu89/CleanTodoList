//
//  ViewController.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 31.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel: UILabel!
    var todoListButton: UIButton!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        createComponents()
        
        addSubViews()
        
        applyLayoutConstraint()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func createComponents() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.text = "My Clean Todo App"
        
        todoListButton = UIButton(type: .system)
        todoListButton.translatesAutoresizingMaskIntoConstraints = false
        todoListButton.setTitle("Open the List view", for: .normal)
        todoListButton.addTarget(self, action: #selector(navigateToTodoList), for: .touchUpInside);
    }
    
    private func addSubViews() {
        view.addSubviewIfNotNil(titleLabel)
        view.addSubviewIfNotNil(todoListButton)
    }
    
    private func applyLayoutConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 44),
            titleLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            todoListButton.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            todoListButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
        ])
    }
    
    @objc private func navigateToTodoList(sender: UIButton) {
        NSLog("navigateToTodoList")
        navigationController?.pushViewController(TodosListViewController(), animated: true)
    }
}

extension UIView {
    func addSubviewIfNotNil(_ view: UIView?) {
        if (view != nil) {
            addSubview(view!)
        }
    }
}

