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
    var title: String?
    var authors: [String]?
    var description: String?
    var pageCount: Int?
    var averageRating: Double?
    var imageLinks: BookImage?
    
    struct BookImage: Codable {
        var thumbnail: URL?
    }
}
