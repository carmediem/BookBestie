//
//  BookInfo.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//

import Foundation

struct TopLevelObject: Codable {
    
    let items: [SecondLevelObject]
}

struct SecondLevelObject: Codable {
    let volumeInfo: BookInfo
}

struct BookInfo: Codable {
    let title: String
    let authors: [String]?
    let description: String?
    let pageCount: Int?
    let averageRating: Double?
    let imageLinks: BookImage?
    
    struct BookImage: Codable {
        let thumbnail: URL
        
        
}
}
