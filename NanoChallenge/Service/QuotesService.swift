//
//  QuotesService.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 10/06/1444 AH.
//

import Foundation

public struct QuoteService {
    //MARK: vars
    var quotesArr = [Quote]()
    
    //MARK: init
    public init() {
        readAndParseLocalQuotesJSONFile()
    }
    
    //MARK: readAndParse JSON functions
    ///Read and parse local quotes JSON file to array of Quotes
    mutating func readAndParseLocalQuotesJSONFile() {
        do {
            //1- find the file path in the bundle
            if let filePath = Bundle.main.path(forResource: "quotes", ofType: "json") {
                //2- file path exits?,then convert the file path as URL.
                let fileUrl = URL(fileURLWithPath: filePath)
                //3- read the entire data at path & return it as a data object
                let jsonData = try Data(contentsOf: fileUrl)
                do {
                    //4- convert data objects to a readable format
                    quotesArr = try JSONDecoder().decode([Quote].self, from: jsonData)
                    print(quotesArr)
                } catch {
                    print("error: \(error)")
                }
            }else {
                print("filePath is not found")
            }
        } catch {
            print("error: \(error)")
        }
    }
    
    //MARK: getQuotesOf category function
    ///Return all quotes within givin category
    public func getQuotesOf(category: String) -> [Quote] {
        var categoryQuotes = [Quote]()
        var counter = 0
        for quote in quotesArr {
            if counter > 200 {
                break
            }
            if quote.category == category {
                categoryQuotes.append(quote)
                counter += 1
            }
        }
        return categoryQuotes
    }
    
    //MARK: getRandomQuote functions
    ///Return random quote within current category to use it in notification
    public func getRandomQuote() -> Quote {
        //current choice of categories
        let currentCategory = UserDefaults.standard.string(forKey: "currentCategory") ?? "inspirational"
        let defaultQuote = Quote(quote: "Whatever we expect with confidence becomes our own self-fulfilling prophecy. - Brian Tracy", category: "love")
        var quote = quotesArr.randomElement() ?? defaultQuote
        while quote.category != currentCategory {
            quote = quotesArr.randomElement() ?? defaultQuote
        }
        return quote
    }
    
}
