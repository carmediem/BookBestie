//
//  BooklistViewModel.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/4/22.
//

import Foundation
import UIKit

class BookListViewModel: ObservableObject {
    
    @Published var books: [BookViewModel] = []
    
//    func search(bookTitle: String) async {
//        let books = BookController.fetchBookInfo(with: bookTitle) { Result<[BookInfo], BookError> in
//            self.books = books.map()
//        }
//        
//        do {
//            let books = try await BookController().fetchBookInfo(searchterm: bookTitle)
//            self.books = books.map(BookViewModel.init)
//        } catch {
//            print(error)
//        }
//    }
}

struct BookViewModel {
    let book: BookInfo
    
    var title: String {
        book.title
    }
    
    var author: String {
        book.authors?.first ?? "No author found"
    }
    
    var imageLinks: URL? {
        book.imageLinks?.thumbnail
    }
}
