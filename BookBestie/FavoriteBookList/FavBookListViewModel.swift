//
//  FavBookListViewModel.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/10/22.
//

import Foundation

//extension FavBookListView {
//class favBookListViewModel: ObservableObject {
   // @Published var books = [BookInfo]()
//    @Published var showingFavs = false
//    @Published var savedBooks: Set<String>
    

//    var filteredBooks: [BookInfo] {
//        if showingFavs {
//            return books.filter { savedBooks.contains($0.id ?? "") }
//        }
//        return books
//    }
//    private var favKeyVM = FavKeyViewModel()
//
//    init() {
//        self.savedBooks = favKeyVM.load()
     //   self.books = BookInfo.init(id: UUID, title: "Harry Potter", author: "JK Roling", coverArt: "", description: "book description", isFavorited: false)
   // }
//    func sortFavs() {
//    //    withAnimation(showingFavs.toggle()) {
//          showingFavs.toggle()
//        }
//    //}
//    func contains(_ book: BookInfo) -> Bool {
//        savedBooks.contains(book.id ?? "")
//    }
//    func toggleFav(book: BookInfo) {
//        if contains(book) {
//            savedBooks.remove(book.id ?? "")
//        } else {
//            savedBooks.insert(book.id ?? "")
//        }
//        favKeyVM.save(items: savedBooks)
//    }
//}
//}

