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
        VStack {
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 130, height: 57.62)
            Spacer()
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
                        .accessibilityLabel("onBoardingHeadline")
                        .accessibilityRemoveTraits(.isStaticText)
                    
                    Text("onBoardingSubHeadline")
                        .font(.headline)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .frame(width: 204)
                        .accessibilityLabel("onBoardingSubHeadlineVoiceOver")
                        .accessibilityRemoveTraits(.isStaticText)
                }
                .position(x: 130, y: 525)
            }
            Spacer()
            /*Button {
                // go to notification
            } label: {
                Image(systemName: "arrow.right")
                    .foregroundColor(Color.white)
                    .frame(width: 40, height: 40)
                    .background(
                        Rectangle()
                            .fill(Color("LightBlueP"))
                    )
                    .cornerRadius(8)
            }*/
            //Spacer()
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
        OnBoarding()
    }
}
