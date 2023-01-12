//
//  NotificationHandler.swift
//  NanoChallenge
//
//  Created by Eman Almarri on 12/01/2023.
//

import Foundation
import UserNotifications

class NotificationHandler {
    //MARK: vars
    let viewModel = ContentViewModel()
    let isArabic = Locale.current.languageCode == "ar" ? true : false
    //MARK: functions
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {success , error in
            if success {
                print ("Access granted")
                
            } else if let error = error {
                print (error.localizedDescription)
            }
        }
    }
    
    // creates the array of time for each notification
    func createIntervalTimesArray(from: Date, to: Date, count: Int) -> [Date] {
        var arrayOfTimes: [Date] = []
        
        // split the interval by chunks
        let timeInterval = to.minutes(from: from) // in minutes
        let lengthOfChunk = timeInterval / count // also in minutes
        print(timeInterval, lengthOfChunk)
        
        var currentTime = from // for cycle to iterate and add more minutes
        for _ in 0..<count {
            currentTime = currentTime.withAddedMinutes(minutes: Double(lengthOfChunk))
            arrayOfTimes.append(currentTime)
        }
        
        return arrayOfTimes
    }
    
    // schedule all notifications
    func scheduleAllNotifications(from: Date, to: Date, count: Int) {
        let timesArray = createIntervalTimesArray(from: from, to: to, count: count)
        print(timesArray)
        for time in timesArray {
            let randomQuote = isArabic ? viewModel.getRandomQuoteAr() : viewModel.getRandomQuote()
            let hour = Calendar.current.component(.hour, from: time)
            let minute = Calendar.current.component(.minute, from: time)
            requestNotification(title: "Bibli", body: randomQuote, hour: hour, minute: minute)
        }
    }
    
    func requestNotification(title: String, body: String, hour: Int, minute: Int = 0) {
        
        //Create content and date Components
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = 0
        
        //Create trigger and request
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error {
                print("error is", error.localizedDescription)
                return
            }
            print("added notification: \(request.identifier)")
            print("Notification at \(hour):\(minute)")
        }
    }
    
}

extension Date {
    
    // returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    // add some minutes to a time
    func withAddedMinutes(minutes: Double) -> Date {
        addingTimeInterval(minutes * 60)
    }
}
