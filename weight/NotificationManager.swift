//
//  NotificationManager.swift
//  weight
//
//  Created by Ido Mizrachi on 18/04/2018.
//  Copyright © 2018 Ido Mizrachi. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationManager {
    init() {
        requestPermissions()
        cancelExistingNotifications()
    }
    
    private func requestPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { [weak self] (success, error) in
            guard let `self` = self else {
                return
            }
            print("Alert permissions - \(success) \(String(describing: error))")
            if success {
                self.scheduleNotification()
            }
        }
    }
    
    private func cancelExistingNotifications() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [NotificationManager.requestIdentifier()])
    }
    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Weight Tracker"
        content.body = "Did you checked your weight today?"
        content.sound = UNNotificationSound(named: "Silent")
        var dateComponent = DateComponents()
        dateComponent.hour = 7
        dateComponent.minute = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let request = UNNotificationRequest(identifier: NotificationManager.requestIdentifier(), content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            print("Added notification - \(String(describing: error))")
        }
        
    }
    
    private static func requestIdentifier() -> String{
        return "weight-tracker-notification"
    }
}
