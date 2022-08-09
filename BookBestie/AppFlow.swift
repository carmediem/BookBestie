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
        LoginView()
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
        }    }
}

//ADD LOGIN VIEW SOMEWHERE HERE
//if logged in, show content view
//if not logged in, show login view
