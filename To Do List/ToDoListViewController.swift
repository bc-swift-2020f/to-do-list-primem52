//
//  ViewController.swift
//  To Do List
//
//  Created by Morgan Prime on 9/27/20.
//  Copyright © 2020 Morgan Prime. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var toDoArray = ["he","she","me","ye"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfrowsinSection was just called returning \(toDoArray.count)")
        return toDoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = toDoArray[indexPath.row]
        return cell
    }
    
    
}

