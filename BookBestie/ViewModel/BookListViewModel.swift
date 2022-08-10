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
    //  @Published var books = [BookInfo]()
    
    @Published var filteredBooks = [BookInfo]()
    @Published var showingFavs = false
    @Published var savedBooks: Set<String>
    @Published var favoriteBooks: [CDFavoriteBook] = []
    
    private var favKeyVM = FavKeyViewModel()
    
    //    var filteredBooks: [BookInfo] {
    //        if showingFavs {
    //            return books.filter { savedBooks.contains($0.id ?? "") }
    //        }
    //        return books
    //    }
    
    init() {
        self.savedBooks = favKeyVM.load()
        //need a function that will fetch all the books and set favorite books to contain all of them. No need for a predicate
        
    }
    
    func sortbyTitle() {
        filteredBooks = filteredBooks.sorted {
            return $0.title < $1.title
        }
    }
    
    func sortByAuthor() {
        filteredBooks = filteredBooks.sorted {
            return $0.authors?.first ?? "" < $1.authors?.first ?? ""
        }
    }
    
    func sortFavs() {
        //    withAnimation(showingFavs.toggle()) {
        showingFavs.toggle()
    }
    
    //}
    func contains(_ book: BookInfo) -> Bool {
        savedBooks.contains(book.id ?? "")
    }
    
    func toggleFav(book: BookInfo) {
        if contains(book) {
            savedBooks.remove(book.id ?? "")
            //this removes it from the array
            //need to go into the coredata store
            //one private function for each of these.
            deleteNewFavBook(bookID: book.id ?? "")
        } else {
            savedBooks.insert(book.id ?? "")
            //need to create one for coredata
            //let new drawing doc = ... context.save. use book instead of drawingdoc
            createNewFavBook(book: book)

        }
        favKeyVM.save(items: savedBooks)
    }
    
    private func createNewFavBook(book: BookInfo) {
        
    }
    
    private func deleteNewFavBook(bookID: String) {
        
    }
//may need to do some fethcing
    
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
