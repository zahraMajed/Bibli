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
    let isArabic = Locale.current.languageCode == "ar" ? true : false
    @Binding var shouldShowOnboarding: Bool

    var body: some View {
        VStack(){
            Spacer()
            Text("Notifications")
                .font(.title)
                .fontWeight(.semibold)
                
            Text("NotificationsDes")
                .font(.headline)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                .padding()
            
            Spacer()
            VStack(){
                DatePicker("Start at :", selection: $startDate, displayedComponents: .hourAndMinute)
                    .bold()
                    .padding()
                DatePicker("End at :", selection: $endDate, displayedComponents: .hourAndMinute)
                    .bold()
                    .padding()
            }.padding()
            
        Spacer()
        if shouldShowOnboarding {
            Button {
                shouldShowOnboarding = false
                notify.scheduleAllNotifications(from: startDate, to: endDate, count: 1)
            } label: {
                Image(systemName: isArabic ? "arrow.left" : "arrow.right")
                    .foregroundColor(Color.white)
                    .frame(width: 40, height: 40)
                    .background(
                        Rectangle()
                            .fill(Color("LightBlueP"))
                    )
                    .cornerRadius(8)
            }
        } else {
            Button {
                notify.scheduleAllNotifications(from: startDate, to: endDate, count: 1)
            } label: {
                Text("Done")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 43)
                    .background(Rectangle()
                        .fill(Color("LightBlueP")))
                    .cornerRadius(8)
            }
        }
        Spacer()
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
