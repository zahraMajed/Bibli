//
//  NotificationHandler.swift
//  NanoChallenge
//
//  Created by Eman Almarri on 12/01/2023.
//

import Foundation
import UserNotifications

class NotificationHandler {
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {success , error in
            if success {
                print ("Access granted")
                
            } else if let error = error {
                print (error.localizedDescription)
            }
        }
    }
    func sendNotification(date: Date, type: String, timeInterval: Double = 10 , title: String, body: String) {
        var trigger : UNNotificationTrigger?
        
       if type == "date" {
           let dateComponents = Calendar.current.dateComponents ([.day, .month, .year, .hour, .minute], from: date)
           trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        } else if type == "time" {
            trigger = UNTimeIntervalNotificationTrigger (timeInterval: timeInterval, repeats: false)
        }
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
