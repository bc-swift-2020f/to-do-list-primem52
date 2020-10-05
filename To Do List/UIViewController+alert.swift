//
//  UIViewController+alert.swift
//  To Do List
//
//  Created by Morgan Prime on 10/5/20.
//  Copyright © 2020 Morgan Prime. All rights reserved.
//

import UIKit

extension UIViewController {
    func oneButtonAlert(tile: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}


//"User Has Not Allowed Notifications"
//"Open settings > toDoList > allow notis"
