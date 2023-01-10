//
//  onBoarding.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 17/06/1444 AH.
//

import SwiftUI

struct onBoarding: View {
    //MARK: vars
    let isArabic = Locale.current.languageCode == "ar" ? true : false
    //MARK: body
    var body: some View {
        ZStack {
            
            Image("quoteOwner")
                .resizable()
                .scaledToFill()
                .frame(width: 345, height: 554)
                .cornerRadius(12)
                .clipShape(QuoteShape())
                .flipsForRightToLeftLayoutDirection(isArabic)
            
            VStack (alignment: .leading){
                Text("onBoardingHeadline")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 2.0)
                Text("onBoardingSubHeadline")
                    .font(.headline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                    .frame(width: 204)
            }
            .position(x: 130, y: 570)
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
                     y: 370.24 )
             )
             path.addLine(
                 to: CGPoint(
                     x: 224 ,
                     y: 370.24 )
             )
             //curves
             path.addCurve(
                to: CGPoint(
                x: 224 ,
                y: 554 ),
                control1: CGPoint(x: 225 , y: 472),
                control2: CGPoint(x: 295 , y: 554 ))
             //curves
             path.addCurve(
                to: CGPoint(
                x: 345 ,
                y: 370.24 ),
                control1: CGPoint(x: 295 , y: 554 ),
                control2: CGPoint(x: 345 , y: 472))
            
             path.addLine(
                 to: CGPoint(
                     x: 345,
                     y: 0)
             )
             path.closeSubpath()
         }
    }
}

struct onBoarding_Previews: PreviewProvider {
    static var previews: some View {
        onBoarding()
    }
}