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
            
        }
        .navigationBarTitle("📚Book Search📚")
    }
}

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


