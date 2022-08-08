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
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)

//            List {
//                ForEach($bookListViewModel.books) { item in
//                    NavigationLink(destination: BookDetailView(book: item)) {
//                        BookDetailView(book: item.wrappedValue)
//                    }
//                }
//            }
            
            
//            //should i use a book id instead of self?
//            List(bookListViewModel.books, id: \.self) { book in
//                HStack {
//                    AsyncImage(url: book.imageLinks, content: { image in
//                        image.resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(maxWidth: 100)
//                    }, placeholder: {
//                    //
//                    })
//                    VStack {
//                    Text(book.title)
//                    Text(book.author)
//                    }
//                }
//            }.listStyle(.plain)
//                .searchable(text: $searchText)
//                .onChange(of: searchText) { value in
//                    async {
//                        if !value.isEmpty && value.count > 1 {
//                            await bookListViewModel.search(name: value)
//                        } else {
//                            bookListViewModel.books.removeAll()
//                        }
//                    }
//                }
            //    .navigationBarTitle("📚Book Search📚")
        }
    }
}
}

//struct SearchBar: UIViewRepresentable {
//    //this will allow us to embed our UI view into our SwiftUI view
//    typealias UIViewType = UISearchBar
//    //conform to the following methods
//    func makeUIView(context: Context) -> UISearchBar {
//        let searchBar = UISearchBar(frame: .zero)
//        searchBar.delegate = context.coordinator
//        searchBar.searchBarStyle = .minimal
//        searchBar.placeholder = "Search for a book.."
//        return searchBar
//    }
//
//    func updateUIView(_ uiView: UISearchBar, context: Context) {
//    }
//
//    func makeCoordinator() -> SearchBarCoordinator {
//        return SearchBarCoordinator()
//    }
//
//    class SearchBarCoordinator: NSObject, UISearchBarDelegate {
//
//    }
//}

//Empty view when a new user opens the app and hasnt listed any favorite books yet. Will have the inspiration or book quote under this.
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
// MARK: -- placeholders for the two views from the tab
struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
            }
            .navigationTitle("Home/Search view")
        }
    }
}

struct SettingsView: View {
        var body: some View {
            NavigationView {
                ZStack {
                    Color.blue
                }
                .navigationTitle("Favorite Book List")
            }
        }
}

//MARK: -- Tab Views
struct tabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "face.smiling")
                    Text("Login")
                }
            FavBookListView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Fav books")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


