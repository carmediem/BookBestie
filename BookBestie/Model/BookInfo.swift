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

struct BookInfo: Codable, Hashable {
    
    var title: String
    var authors: [String]?
    var description: String?
    var pageCount: Int?
    var averageRating: Double?
    var imageLinks: BookImage?
    var id: String? = UUID().uuidString
    
    struct BookImage: Codable, Hashable {
        var thumbnail: URL?
    }
    
    // MARK: Neat class level helper function
    static func make(from book: CDFavoriteBook) -> BookInfo {
        return BookInfo(title: book.cdTitle ?? "", authors: [book.cdAuthor ?? ""], description: book.cdDescription ?? "", pageCount: Int(book.cdPageCount), averageRating: book.cdAverageRating, imageLinks: BookImage(thumbnail: URL(string: "Are you using this?")), id: book.cdID?.uuidString)
    }
}
