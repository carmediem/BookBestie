//
//  AppFlow.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/4/22.
//

import Foundation
import SwiftUI

struct AppFlow: View {
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                Label("Search", systemImage: "magnifyingglass")
                }
            
            FavBookListView()
                .tabItem {
                    Label("Favorites", systemImage: "magazine")
                }
        }
    }
}
