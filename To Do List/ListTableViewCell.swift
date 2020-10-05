//
//  ListTableViewCell.swift
//  To Do List
//
//  Created by Morgan Prime on 10/5/20.
//  Copyright © 2020 Morgan Prime. All rights reserved.
//

import UIKit


protocol ListTableViewCellDelegate: class {
    func checkBoxToggle(sender: ListTableViewCell)
}

class ListTableViewCell: UITableViewCell {
    
  

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    weak var delegate: ListTableViewCellDelegate?
    
    var toDoItem: ToDoItem!{
        didSet {
            nameLabel.text = toDoItem.name
            checkBoxButton.isSelected = toDoItem.completed
        }
    }
    
    @IBAction func checkToggled(_ sender: UIButton) {
        delegate?.checkBoxToggle(sender: self)
    }
}
