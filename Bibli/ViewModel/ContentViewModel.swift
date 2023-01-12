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
    //MARK: getgetRandomQuote
    func getRandomQuote() -> String {
        return quoteService.getRandomQuote().quote
    }
    
    //MARK: get all abrabic quotes
    ///Return all arabic quotes
    func getArabicQuotes() -> [QuoteAr] {
        return quoteService.quotesArArr
    }
    
    //MARK: get random abrabic quotes
    func getRandomQuoteAr() -> String {
        return quoteService.getRandomQuoteAr().quote
    }
    
}
