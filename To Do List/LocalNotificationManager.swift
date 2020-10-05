//
//  LocalNotificationManager.swift
//  To Do List
//
//  Created by Morgan Prime on 10/5/20.
//  Copyright © 2020 Morgan Prime. All rights reserved.
//

import UIKit
import UserNotifications

struct LocalNotificationManager {
    
    static func authorizeLocalNotifications(viewController: UIViewController){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (granted, error) in
            guard error == nil else{
                print("ERROR: \(error!.localizedDescription)")
                return
            }
            if granted{
                print("Authorization granted")
            }
            else {
                print("Denied authorization")
                //alert to tell user what to do
                DispatchQueue.main.async {
                    viewController.oneButtonAlert(tile: "User Has Not Allowed Notifications", message: "Open settings > toDoList > allow notis")
                }
                
            }
        }
    }
    
    static func isAuthorized(completed: @escaping (Bool)->()){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (granted, error) in
            guard error == nil else{
                print("ERROR: \(error!.localizedDescription)")
                completed(false)
                return
            }
            if granted{
                print("Authorization granted")
                completed(true)
            }
            else {
                print("Denied authorization")
                completed(false)
                }
                
            }
    }

    
    static func setCalendarNotification(title: String, subtitle: String, body: String, badgeNumber: NSNumber?, sound: UNNotificationSound?, date: Date) -> String {
        //create content
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.badge = badgeNumber
        content.sound = sound
        //create trigger
        var dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute], from: date)
        dateComponents.second = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //create Request
        let notificationID = UUID().uuidString
        let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
        
        //register request with noti center
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error{
                print("ERROR: \(error.localizedDescription)")
            }
            else{
                print("Noti scheduled \(notificationID), title: \(content.title)")
            }
        }
        return notificationID
    }
    
}
