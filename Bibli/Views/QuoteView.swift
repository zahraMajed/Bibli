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
        VStack {
            Text(isArabic ? quoteAr!.quote : getQuoteAndAuthor(quote: quote!).0)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(Color.black)
                .padding(.bottom, 10)
            Text(isArabic ? quoteAr!.author : getQuoteAndAuthor(quote: quote!).1)
                .font(.system(size: 18, weight: .light, design: .rounded))
                .foregroundColor(Color.black)
                .padding(.bottom, 10)
        }
        .accessibilityLabel(isArabic ? "\(quoteAr!.author) said \(quoteAr!.quote)" : "\(getQuoteAndAuthor(quote: quote!).1) said \(getQuoteAndAuthor(quote: quote!).0)")
        .frame(maxWidth: .infinity, alignment: .center)
        .multilineTextAlignment(.center)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
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
