//
//  Quotes.swift
//  NanoChallenge
//
//  Created by Zahra Majed Alzawad on 10/06/1444 AH.
//

import Foundation


public struct Quote: Codable, Hashable {
    //MARK: vars
    public let quote: String
    public let category: String
    
    /*
    //MARK: init
    public init(quote: String, category: String) {
        self.quote = quote
        self.category = category
    }
    
    //MARK: functions
    public func getEncodedString() -> String? {
        guard let data = try? JSONEncoder().encode(self),
              let json = String(data: data, encoding: .utf8) else {
            return nil
        }

        return json.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        //Returns a new string made from the receiver by replacing all characters not in the specified set with percent-encoded characters.
    }
    
    //convert data objects to a readable format.
    public static func quote(from encoded: String) -> Quote? {
        guard let decoded = encoded.removingPercentEncoding else {
            return nil
        }

        guard let data = decoded.data(using: .utf8), let quote = try? JSONDecoder().decode(Quote.self, from: data) else {
            return nil
        }

        return quote
    }*/
}

//MARK: concept explaination
//Hashable is "a type that provides an integer hash value”. A hashValue is an integer that is the same for any two instances that compare equally.
//Codable is a type that can convert itself into and out of an external representation. it's alias for two other protocols: Encodable and Decodable
//Encode: Convert from swift to other representation such as JSON.
//Decode: Convert from external representation such as JSON to swift.
//If your property names match your JSON field names, and your properties are all Codable, then you can convert to or from JSON very easily.
