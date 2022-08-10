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
    
   var books: [BookInfo] = []

    var body: some View {
      NavigationView {
          ZStack {
              Color("background4").edgesIgnoringSafeArea(.all)
              
              
              Button(action: {
                  bookListViewModel.sortFavs()
              }, label: {
                  Text("Toggle Favorites")
              })
              .padding()
              
        List {
           Section(header: SortView()) {
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
}


struct FavBookListView_Previews: PreviewProvider {
    static var previews: some View {
        FavBookListView()
    }
}
