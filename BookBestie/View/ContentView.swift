//
//  ContentView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//
import UIKit
import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject private var bookListViewModel = BookListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
//THIS IS WHERE YOU CALL THE COLLETION VIEW
                BookCollectionViewControllerRepresentable()
                
//            List {
//                ForEach($bookListViewModel.books) { item in
//                    NavigationLink(destination: BookDetailView(book: item)) {
//                        BookDetailView(book: item.wrappedValue)
//                    }
//                }
//            }
//          }
            //    .navigationBarTitle("📚Book Search📚")
        }
    }
}
}


//Empty view when a new user opens the app and hasnt listed any favorite books yet. Will have the inspiration or book quote under this.
//This will be moved over to the UISearchBarView
struct EmptyView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "books.vertical")
                .font(.system(size: 85))
                .padding(.bottom)
            Text("Find your next favorite book")
                .font(.title)
            Spacer()
        }
        .padding()
        .foregroundColor(Color(.systemCyan))
    }
}
//// MARK: -- placeholders for the two views from the tab
//struct HomeView: View {
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.red
//            }
//            .navigationTitle("Home/Search view")
//        }
//    }
//}
//
//struct SettingsView: View {
//        var body: some View {
//            NavigationView {
//                ZStack {
//                    Color.blue
//                }
//                .navigationTitle("Favorite Book List")
//            }
//        }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


