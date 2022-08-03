//
//  ContentView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//
import UIKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                SearchBar()
                EmptyView()
                
            }
            .navigationBarTitle("📚Book Search📚")
        }
    }
}

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

struct SearchBar: UIViewRepresentable {
    //this will allow us to embed our UI view into our SwiftUI view
    typealias UIViewType = UISearchBar
    //conform to the following methods
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search for a book.."
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator()
    }
    
    class SearchBarCoordinator: NSObject, UISearchBarDelegate {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//import SwiftUI
//
//
//struct ContentView: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//                 Image("BookImage")
//                     .resizable()
//                     .clipShape(RoundedRectangle(cornerRadius: 4))
//
//                 Text("Book Title")
//                     .font(.headline)
//
//                 Text("Author Name")
//                     .font(.body)
//                     .lineLimit(1)
//             }
//         }
//     }
//
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
