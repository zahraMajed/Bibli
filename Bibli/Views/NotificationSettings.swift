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
            Text("Notifications")
                .font(.title)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(50)
            VStack(){
                DatePicker("Start at :", selection: $startDate, displayedComponents: .hourAndMinute)
                    .background(Color(.lightGray).opacity(0.19))
                    .cornerRadius(11)
                    .foregroundColor(.black)
                    .bold()
                    .padding()
                DatePicker("End at :", selection: $endDate, displayedComponents: .hourAndMinute)
                    
                        .background(Color(.lightGray).opacity(0.19))
                        .cornerRadius(11)
                        .foregroundColor(.black)
                        .bold()
                        .padding()
            }.padding()

                
            if shouldShowOnboarding {
            Button {
                shouldShowOnboarding = false
                notify.scheduleAllNotifications(from: startDate, to: endDate, count: 1)
            } label: {
                
                Text(" Done ")
            .font(.title2)
       .fontWeight(.medium)
       .foregroundColor(Color.white)
       .multilineTextAlignment(.center)
       .frame(width: 120, height: 60)
       .background(Rectangle()
       .fill(Color("LightBlueP")))
       .cornerRadius(5)
       .padding(50)
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
