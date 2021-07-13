//
//  UIView+Extension.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 13.07.21.
//

import Foundation
import UIKit

extension UIView {
    func addSubviewIfNotNil(_ view: UIView?) {
        if (view != nil) {
            addSubview(view!)
        }
    }
}
