//
//  TabBar.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/9/22.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            BookSearchSwiftUI()
                .tabItem {
                    Image(systemName: "face.smiling")
                    Text("Search")
                }
            FavBookListView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
