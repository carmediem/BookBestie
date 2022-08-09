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
    var body: some View {
        TabBar()
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


