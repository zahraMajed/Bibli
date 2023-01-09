//
//  ContentViewModel.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 10/06/1444 AH.
//

import Foundation

struct ContentViewModel {
    //MARK: vars
    let quoteService = QuoteService()
    
    //MARK: getQuotesOf category function
    ///Return all quotes within givin category
    func getQuotesOf(category: String) -> [Quote] {
        let categoryQuotes = quoteService.getQuotesOf(category: category)
        return categoryQuotes.shuffled()
    }
    
    //MARK: get all abrabic quotes
    ///Return all arabic quotes
    func getArabicQuotes() -> [QuoteAr] {
        return quoteService.quotesArArr
    }
    
}
