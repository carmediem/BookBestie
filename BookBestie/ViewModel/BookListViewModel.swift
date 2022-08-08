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

    @Published var filteredBooks = [BookInfo]()

func sortbyTitle() {
    filteredBooks = filteredBooks.sorted {
        return $0.title < $1.title
    }
}

//func sortByAuthor() {
//    filteredBooks = filteredBooks.sorted {
//        return $0.author < $1.author
//    }
//}
}

extension FavBookListView {
final class ViewModel: ObservableObject {
    @Published var books = [BookInfo]()
    @Published var showingFavs = false
    @Published var savedBooks: Set<UUID>
    
    #warning("ask Eric abo9ut ")
    var filteredBooks: [BookInfo] {
        if showingFavs {
            return books.filter { savedBooks.contains($0.id) }
        }
        return books
    }
    private var favKeyVM = FavKeyViewModel()
    
    init() {
        self.savedBooks = favKeyVM.load()
     //   self.books = BookInfo.init(id: UUID, title: "Harry Potter", author: "JK Roling", coverArt: "", description: "book description", isFavorited: false)
    }
    func sortFavs() {
    //    withAnimation() {
            showingFavs.toggle()
        }
    //}
    func contains(_ book: BookInfo) -> Bool {
        savedBooks.contains(book.id)
    }
    func toggleFav(book: BookInfo) {
        if contains(book) {
            savedBooks.remove(book.id)
        } else {
            savedBooks.insert(book.id)
        }
        favKeyVM.save(items: savedBooks)
    }
}
}


struct BookViewModel {
    let book: BookInfo
    
    var title: String {
        book.title
    }
    
    var author: String {
        book.authors
    }
    
    var imageLinks: URL? {
        book.imageLinks.thumbnail
    }
}
