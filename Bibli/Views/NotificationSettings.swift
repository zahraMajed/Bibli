//
//  NotificationSettings.swift
//  NanoChallenge
//
//  Created by Eman Almarri on 10/01/2023.
//

import SwiftUI

struct NotificationSettings: View {
    //MARK: vars
    let notify = NotificationHandler()
    @State var startDate = Date()
    @State var endDate = Date()
    var closedRange = Calendar.current.date (byAdding: .year, value: -1, to: Date())!
    @Binding var shouldShowOnboarding: Bool

    var body: some View {
        VStack {
        Form {
            Text("Notifications")
                .font(.title)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Section(header:Text("pick time")) {
                DatePicker("Start at:", selection: $startDate, displayedComponents: .hourAndMinute)
            }
            DatePicker("End at:", selection: $endDate, displayedComponents: .hourAndMinute)
            
        }
        if shouldShowOnboarding {
            Button {
                //shouldShowOnboarding = false
                notify.scheduleAllNotifications(from: startDate, to: endDate, count: 1)
            } label: {
                Image(systemName: "arrow.right")
                    .foregroundColor(Color.white)
                    .frame(width: 40, height: 40)
                    .background(
                        Rectangle()
                            .fill(Color("LightBlueP"))
                    )
                    .cornerRadius(8)
            }
        } else {
            //save changes button
        }
        }
        .onAppear{
            notify.askPermission()
        }
        
    }
}

struct NotificationSettings_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationSettings(shouldShowOnboarding: .constant(true)).preferredColorScheme(.light)
            NotificationSettings(shouldShowOnboarding: .constant(true)).preferredColorScheme(.dark)
        }
    }
}
