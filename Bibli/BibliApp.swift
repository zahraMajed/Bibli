//
//  NanoChallengeApp.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 10/06/1444 AH.
//

import SwiftUI

@main
struct BibliApp: App {
    
    var body: some Scene {
        WindowGroup {
            NotificationSettings(shouldShowOnboarding: .constant(true))
                //.environment(\.locale, .init(identifier: "ar"))
        }
    }
}
