//
//  FavBookListView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/7/22.
//

import SwiftUI
import Foundation

struct FavBookListView: View {
    
    @StateObject private var bookViewModel = BookDataStore()

    var body: some View {
      NavigationView {
  //        Button("Toggle Favorites", action: bookViewModel.sortFavorites)
  //            .padding()
        List {
       //    Section(header: SortView(bookListViewModel: BookListView())) {
          ForEach($bookViewModel.books) { item in

            NavigationLink(destination: BookDetailView(book: item)) {
              BookRowView(book: item.wrappedValue)
            }
          }
          .onDelete(perform: bookViewModel.deleteBook(indexSet:))
        }
        .listStyle(PlainListStyle())
        .navigationTitle("My Favorite Books")
      }
    }
  }
  //}


struct FavBookListView_Previews: PreviewProvider {
    static var previews: some View {
        FavBookListView()
    }
}
