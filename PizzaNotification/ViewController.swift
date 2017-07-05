//
//  ViewController.swift
//  PizzaNotification
//
//  Created by abhay singh on 04/07/17.
//  Copyright © 2017 abhay singh. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    var grantedAccess = false
    @IBAction func sendNotification(_ sender: UIButton) {
        if grantedAccess{ //only have a notification if permitted by the user
            
            //Add content for the notification
            let content = UNMutableNotificationContent()
            content.title = "Pizza Alert"
            content.body = "Your pizza is ready"
            content.categoryIdentifier = "myCategory"
            //Add a trigger for 10 seconds
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
            //crete a notification request from the content and trigger
            let request = UNNotificationRequest(identifier: "Pizza.Done", content: content, trigger: trigger)
            //schedule a request
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            //set categories
            
            let action1 = UNNotificationAction(identifier: "not,not", title: "Not now!!", options: [])
            let category = UNNotificationCategory(identifier: "myCategory", actions: [action1], intentIdentifiers: [], options: [])
            UNUserNotificationCenter.current().setNotificationCategories([category])
            
            
            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up useer authoriztions to use ntifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {(granted,error) -> Void in self.grantedAccess = granted })
        
        //Setting up a category
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

