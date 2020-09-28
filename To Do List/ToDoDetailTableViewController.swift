//
//  ToDoDetailTableViewController.swift
//  To Do List
//
//  Created by Morgan Prime on 9/28/20.
//  Copyright © 2020 Morgan Prime. All rights reserved.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {

    @IBOutlet weak var noteView: UITextView!
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode{
            dismiss(animated: true, completion: nil)
        }
        else{
            navigationController?.popViewController(animated: true)
        }
    }
}
