//
//  ContentView.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 10/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: vars
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = false
    
    //MARK: body
    var body: some View {
        TabView {
            QuotesView()
                .tabItem{Label("Quotes", systemImage: "quote.opening")}
            NotificationSettings(shouldShowOnboarding: $shouldShowOnboarding)
                .tabItem { Label("Notifications", systemImage: "bell") }
        }
        .accentColor(Color("LightBlueP"))
        .fullScreenCover(isPresented: $shouldShowOnboarding) {
            OnBoardings(shouldShowOnboarding: $shouldShowOnboarding)}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                    .preferredColorScheme(.dark)
        }
    }
}
