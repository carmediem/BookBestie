//
//  BookBestieApp.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//

import SwiftUI

@main
struct BookBestieApp: App {
    var body: some Scene {
        WindowGroup {
            AppFlow()

                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .environmentObject(BookListViewModel())
//            BookSearchSwiftUI()

        }
    }
}
