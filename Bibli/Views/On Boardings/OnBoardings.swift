//
//  OnBoardings.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 17/06/1444 AH.
//

import SwiftUI

struct OnBoardings: View {
    //MARK: vars
    @Binding var shouldShowOnboarding: Bool
    //MARK: body
    var body: some View {
        TabView{
            OnBoarding()
            //the next one should be the notification settings view and it should have the button that toggle the shouldShowOnboarding
            NotificationSettings()
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .ignoresSafeArea()
    }
}

struct OnBoardings_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardings(shouldShowOnboarding: .constant(true))
    }
}
