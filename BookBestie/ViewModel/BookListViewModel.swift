//
//  BooklistViewModel.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/4/22.
//

import Foundation
import UIKit
import SwiftUI

class BookListViewModel: ObservableObject {
    
    @Published var books: [BookViewModel] = []

    @Published var filteredBooks = [BookInfo]()

func sortbyTitle() {
    filteredBooks = filteredBooks.sorted {
        return $0.title < $1.title
    }
}

//func sortByAuthor() {
//    filteredBooks = filteredBooks.sorted {
//        return $0.authors < $1.authors
//    }
//}
}

struct BookViewModel {
    let book: BookInfo
    
    var title: String {
        book.title
    }
    
    var author: String {
        book.authors?.first ?? ""
    }
    
    var imageLinks: URL? {
        book.imageLinks?.thumbnail
    }
}
