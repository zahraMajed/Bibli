//
//  NotificationSettings.swift
//  NanoChallenge
//
//  Created by Eman Almarri on 10/01/2023.
//

import SwiftUI

struct NotificationSettings: View {
    //MARK: vars
    @State var currentTime = Date()
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
                
                DatePicker("Start at :", selection: $currentTime, displayedComponents: .hourAndMinute)
            }
            DatePicker("End at :", selection: $currentTime, displayedComponents: .hourAndMinute)
            
        }
        if shouldShowOnboarding {
            Button {
                shouldShowOnboarding.toggle()
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
        
        
    }
}

struct NotificationSettings_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSettings(shouldShowOnboarding: .constant(true))
    }
}
