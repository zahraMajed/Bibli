//
//  QuoteView.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 10/06/1444 AH.
//

import SwiftUI

struct QuoteView: View {
    //MARK: vars
    public var quote: Quote
    
    var body: some View {
        VStack {
            Text(quote.quote)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .shadow(color: .black, radius: 2)
            Text(quote.category)
                .font(.system(size: 18, weight: .light, design: .rounded))
                .shadow(color: .black, radius: 2)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .multilineTextAlignment(.center)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: Quote(quote: "I love you more than there are stars in the sky and fish in the sea. — Nicholas Sparks", category: "love"))
    }
}
