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
}

public struct QuoteAr: Codable, Hashable {
    //MARK: vars
    public let quote: String
    public let author: String
}

//MARK: concept explanation
//Hashable is "a type that provides an integer hash value”. A hashValue is an integer that is the same for any two instances that compare equally.
//Codable is a type that can convert itself into and out of an external representation. it's alias for two other protocols: Encodable and Decodable
//Encode: Convert from swift to other representation such as JSON.
//Decode: Convert from external representation such as JSON to swift.
//If your property names match your JSON field names, and your properties are all Codable, then you can convert to or from JSON very easily.
