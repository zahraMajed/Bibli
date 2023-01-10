//
//  SplashView.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 17/06/1444 AH.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        GIFView(type: .name("BibliLogo"))
            .frame(width: 390, height: 500)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
