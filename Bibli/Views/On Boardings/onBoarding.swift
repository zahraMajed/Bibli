//
//  onBoarding.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 17/06/1444 AH.
//

import SwiftUI

struct OnBoarding: View {
    //MARK: vars
    let isArabic = Locale.current.languageCode == "ar" ? true : false
    //MARK: body
    var body: some View {
        
        GeometryReader { Proxy in
            //Logo
            Image("Logo")
                .resizable()
                .frame(width: Proxy.size.width * 0.33, height: Proxy.size.height * 0.06)
                .position(x: Proxy.size.width / 2, y: Proxy.size.height * 0.055)
            //Image
            Image("quoteOwner")
                .resizable()
                .scaledToFill()
                .frame(width: Proxy.size.width * 0.87, height: Proxy.size.height * 0.72)
                .cornerRadius(12)
                .clipShape(QuoteShape().path(in: Proxy.frame(in: .global)))
                .position(x: Proxy.size.width / 2, y: Proxy.size.height / 2)
                .flipsForRightToLeftLayoutDirection(isArabic)
            
            //Text
            VStack (alignment: .leading){
                Text("onBoardingHeadline")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 2.0)
                    .accessibilityLabel("onBoardingHeadline")
                    .accessibilityRemoveTraits(.isStaticText)
                
                Text("onBoardingSubHeadline")
                    .font(.headline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                    .accessibilityLabel("onBoardingSubHeadlineVoiceOver")
                    .accessibilityRemoveTraits(.isStaticText)
            }
            .frame(width: Proxy.size.width * 0.55, height:.infinity, alignment: .leading)
            .position(x: Proxy.size.width * 0.33, y: Proxy.size.height * 0.759)
            
        }
    }
}

struct QuoteShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(
                to: CGPoint(
                    x: 0 ,
                    y: 0
                )
            )
            path.addLine(
                to: CGPoint(
                    x: 0 ,
                    y: rect.size.height * 0.50 )
            )
            path.addLine(
                to: CGPoint(
                    x: rect.size.width * 0.569 ,
                    y: rect.size.height * 0.50 )
            )
            //curves
            path.addCurve(
                to: CGPoint(
                    x: rect.size.width * 0.569 ,
                    y: rect.size.height * 0.72 ),
                control1: CGPoint(x: rect.size.width *  0.57 , y: rect.size.height * 0.62),
                control2: CGPoint(x: rect.size.width * 0.75 , y: rect.size.height * 0.72 ))
            //curves
            path.addCurve(
                to: CGPoint(
                    x: rect.size.width * 0.87 ,
                    y: rect.size.height * 0.50),
                control1: CGPoint(x: rect.size.width * 0.75 , y: rect.size.height * 0.72),
                control2: CGPoint(x: rect.size.width * 0.87 , y: rect.size.height * 0.62))
            path.addLine(
                to: CGPoint(
                    x: rect.size.width * 0.87,
                    y: 0)
            )
            path.closeSubpath()
        }
    }
}

struct onBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
