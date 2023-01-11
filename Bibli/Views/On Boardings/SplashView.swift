//
//  SplashView.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 17/06/1444 AH.
//

import SwiftUI

struct SplashView: View {
    //MARK: vars
    @State private var isSplashActive = true
    //MARK: body
    var body: some View {
        
        if isSplashActive {
            GIFView(type: .name("BibliLogo"))
                .frame(width: 390, height: 500)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        self.isSplashActive = false
                    }
                }
        } else {
            ContentView()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
