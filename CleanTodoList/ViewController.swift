//
//  ViewController.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 31.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    var helloLabel: UILabel!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        createComponents()
        
        addSubViews()
        
        applyLayoutConstraint()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func createComponents() {
        helloLabel = UILabel()
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.textAlignment = .right
        helloLabel.text = "Hello world !"
    }
    
    private func addSubViews() {
        view.addSubviewIfNotNil(helloLabel)
    }
    
    private func applyLayoutConstraint() {
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            helloLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
}

extension UIView {
    func addSubviewIfNotNil(_ view: UIView?) {
        if (view != nil) {
            addSubview(view!)
        }
    }
}

