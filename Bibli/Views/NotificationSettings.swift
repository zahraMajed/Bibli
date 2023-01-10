//
//  NotificationSettings.swift
//  NanoChallenge
//
//  Created by Eman Almarri on 10/01/2023.
//

import SwiftUI

struct NotificationSettings: View {
    
    @State var currentTime = Date()
    var closedRange = Calendar.current.date (byAdding: .year, value: -1, to: Date())!
    
    var body: some View {
        Form {
            Text("Notifications")
                .font(.title)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)

            Section(header:Text("pick time")) {
              
                DatePicker("Start at :", selection: $currentTime, displayedComponents: .hourAndMinute)
            }
                DatePicker("End at :", selection: $currentTime, displayedComponents: .hourAndMinute)
            }
    }
}

struct NotificationSettings_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSettings()
    }
}
