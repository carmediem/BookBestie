//
//  BooklistViewModel.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/4/22.
//

import Foundation
import UIKit
import SwiftUI
import CoreData

class BookListViewModel: ObservableObject {
    
    @Published var books: [BookViewModel] = []
    //  @Published var books = [BookInfo]()
    
    @Published var filteredBooks = [BookInfo]()
    @Published var showingFavs = false
    @Published var savedBooks: Set<String>
    @Published var favoriteBooks: [CDFavoriteBook] = []
    
    private var favKeyVM = FavKeyViewModel()
    
    let persistentContainer = PersistenceController.shared.container
    
    init() {
        self.savedBooks = favKeyVM.load()
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
    
    //check if self contains the book we tapped using the contains function (above). Logic is below.
    func toggleFav(book: BookInfo) {
        if contains(book) {
            savedBooks.remove(book.id ?? "")
            deleteNewFavBook(bookID: book.id ?? "")
        } else {
            savedBooks.insert(book.id ?? "")
            createNewFavBook(book: book)
        }
        favKeyVM.save(items: savedBooks)
    }
    
    
    
    private func createNewFavBook(book: BookInfo) {
        let context = persistentContainer.newBackgroundContext()
        context.perform {
            let newFavBook = CDFavoriteBook(entity: CDFavoriteBook.entity(), insertInto: context)
            newFavBook.cdTitle = book.title
            newFavBook.cdAuthor = book.authors?.first
            newFavBook.cdDescription = book.description ?? ""
            newFavBook.cdPageCount = Int32(book.pageCount ?? 0)
            newFavBook.cdAverageRating = book.averageRating ?? 5
            newFavBook.cdID = UUID(uuidString: book.id ?? "")
            CoreDataManager.shared.saveContext(context: context)
        }
    }
    
    func deleteNewFavBook(bookID: String) {
        let request: NSFetchRequest<CDFavoriteBook> = CDFavoriteBook.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(CDFavoriteBook.cdAuthor), ascending: false)]
        let context = persistentContainer.newBackgroundContext()
        context.perform {
            if let existing = try? context.fetch(request).first {
                context.delete(existing)
            }
        }
    }
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



/*
 Threading:
 - if you have too much writing on a scratchpad. Each scratchpad has a certain amount of memory. Once that memory is taken up, it slows down or you need a new thread.
 - each thread does some work
 - DispatchQueue.main thread displays the views. The main thread is also where you update state, binding in the views. Do the heavy lifting in the background threads.
 - Keep the main thread for UI
 - Can also create your own threads (bookloader thread, url thread, etc- also give it a priorirty)
 
 
 GDC:
 - Grand Central Dispatch (dispatch queue)
 */

/*
 Context:
 - not unique to CoreData but genearlly means the same as thread
 - memory bank
 - Core data has its own threading not connected to Dispatch Queue
 - if you want to do work in Core Data on a background thread, stay on the main thread because if you're on the background thread and the Core Data thread, it'll have to switch back and forth
 
 
 Problem with making multiple context is that you could be creating and saving contexts in different threads.
 */
