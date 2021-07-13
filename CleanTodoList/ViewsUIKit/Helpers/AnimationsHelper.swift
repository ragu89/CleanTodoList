//
//  AnimationsHelper.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 13.07.21.
//

import Foundation
import UIKit

class AnimationsHelper {
    
    public static func reloadTableViewWithAnimation(tableView: UITableView) {
        UIView.transition(
            with: tableView,
            duration: 0.35,
            options: .transitionCrossDissolve,
            animations: { tableView.reloadData() },
            completion: nil
        )
    }
    
}
