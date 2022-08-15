//
//  FavBookListView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/7/22.
//

import SwiftUI
import Foundation

struct FavBookListView: View {
    //all the books added to bookViewModel
    @StateObject private var bookViewModel = BookDataStore()
    //books that are added to the favorite list by toggling. this is what is used for sorting by author and title
    @EnvironmentObject var bookListViewModel: BookListViewModel
    
    @FetchRequest(entity: CDFavoriteBook.entity(), sortDescriptors: [], predicate: nil, animation: .linear)
    var favBooks: FetchedResults<CDFavoriteBook>
    
    var books: [BookInfo] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background4").edgesIgnoringSafeArea(.all)
                
                List {
                    Section(header: SortView()) {
                        if !bookListViewModel.showingFavs {
                            ForEach(bookViewModel.books, id: \.self) { book in
                                
                                NavigationLink(destination: BookDetailView(book: book)) {
                       //             BookRowView(book: "", cdAuthorText: "", cdDescriptionText: "", cdImage:, cdTitleText: "", cdImage:)
                                }
                            }
                            .onDelete(perform: bookViewModel.deleteBook(indexSet:))
                        } else {
                            ForEach(favBooks, id: \.self) { favBook in
                                // MARK: You need to make this display whatever info you want now, instead of just a title. BookDetailView has a book property, that is a BookInfo. NOT a CDFavoriteBook. You must convert the CDFavoriteBook --> BookInfo
                                
                                   NavigationLink(destination: BookDetailView(book: nil, favoriteBook: favBook)) {
                                       VStack(alignment: .leading) {
                                       Text(favBook.cdTitle ?? "Nothing here")
                                               .bold()
                                           Text(favBook.cdAuthor ?? "Nothing here")
                                
//                                          BookRowView(book: book)
                                       }
                                      }
                            }
                            .onDelete { indexSet in
                                for index in indexSet {
                                    let favBook = favBooks[index]
                                    bookListViewModel.deleteNewFavBook(bookTitle: favBook.cdTitle ?? "")
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("My Favorite Books")
                }
            }
        }
        .onAppear {
            print(favBooks.count)
        }
    }
}


struct FavBookListView_Previews: PreviewProvider {
    static var previews: some View {
        FavBookListView()
    }
}
