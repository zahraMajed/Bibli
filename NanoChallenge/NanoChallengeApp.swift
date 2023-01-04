//
//  NanoChallengeApp.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 10/06/1444 AH.
//

import SwiftUI

@main
struct NanoChallengeApp: App {
    //MARK: Vars for onboarding
    //let onboardingDone = UserDefaults.standard.bool(forKey: "OnboardingDone")
    //let data = OnboardingDataModel.data
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.locale, .init(identifier: "ar"))
        }
    }
}
