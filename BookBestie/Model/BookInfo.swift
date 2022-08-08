//
//  BookInfo.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//

import Foundation

struct TopLevelObject: Codable {
    var items: [SecondLevelObject]

}

struct SecondLevelObject: Codable {
    var volumeInfo: BookInfo

}

struct BookInfo: Codable, Identifiable {
    var title: String
    var authors: String
    var description: String
    var pageCount: Int
    var averageRating: Double
    var imageLinks: BookImage
    var id = UUID()

    
    struct BookImage: Codable {
        var thumbnail: URL
        

}
}
