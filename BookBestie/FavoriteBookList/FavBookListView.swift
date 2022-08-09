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
    //books that are added to the favorite list by toggleing
    @StateObject var bookListViewModel = BookListViewModel()

    var body: some View {
      NavigationView {
        //  Button("Toggle Favorites", action: $bookListViewModel.sortFavs)
  //            .padding()
        List {
           Section(header: SortView(bookListViewModel: BookListViewModel())) {
            ForEach(bookViewModel.books, id: \.self) { (book: BookInfo) in

            NavigationLink(destination: BookDetailView(book: book)) {
              BookRowView(book: book)
            }
          }
          .onDelete(perform: bookViewModel.deleteBook(indexSet:))
        }
        .listStyle(PlainListStyle())
        .navigationTitle("My Favorite Books")
      }
    }
  }
}


struct FavBookListView_Previews: PreviewProvider {
    static var previews: some View {
        FavBookListView()
    }
}
