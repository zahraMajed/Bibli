//
//  QuoteView.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 10/06/1444 AH.
//

import SwiftUI

struct QuoteView: View {
    //MARK: vars
    let isArabic = Locale.current.languageCode == "ar" ? true : false
    public var quote: Quote?
    public var quoteAr: QuoteAr?
    
    //MARK: body
    var body: some View {
        VStack (spacing: 20){
            Text(isArabic ? quoteAr!.quote : getQuoteAndAuthor(quote: quote!).0)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .padding([.top, .leading, .trailing])
                .frame(width: UIScreen.main.bounds.width * 0.99)
            Text(isArabic ? quoteAr!.author : getQuoteAndAuthor(quote: quote!).1)
                .font(.headline)
                .fontWeight(.light)
                .foregroundColor(Color.white)
                .padding([.leading, .bottom, .trailing])
                .frame(width: UIScreen.main.bounds.width * 0.99)
        }
        .multilineTextAlignment(.center)
        .accessibilityLabel(isArabic ? "\(quoteAr!.author) said \(quoteAr!.quote)" : "\(getQuoteAndAuthor(quote: quote!).1) said \(getQuoteAndAuthor(quote: quote!).0)")
        .background(Color("DarkBrownS").opacity(0.93))
        .cornerRadius(14)
        
    }
    //MARK: functions
    func getQuoteAndAuthor(quote: Quote) -> (String, String) {
        let components = quote.quote.components(separatedBy: "—")
        return (components[0], components[1])
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: Quote(quote: "I love you more than there are stars in the sky and fish in the sea. — Nicholas Sparks", category: "love"))
    }
}
