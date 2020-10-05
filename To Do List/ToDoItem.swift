//
//  ToDoItem.swift
//  To Do List
//
//  Created by Morgan Prime on 9/28/20.
//  Copyright © 2020 Morgan Prime. All rights reserved.
//

import Foundation

struct ToDoItem: Codable {
    var name: String
    var date: Date
    var notes: String
    var reminderSet: Bool
    var notificationID: String?
    var completed: Bool
 }
 
