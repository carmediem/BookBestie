//
//  BookSearchSwiftUI.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/8/22.
//

import SwiftUI

struct BookSearchSwiftUI: View {
    @EnvironmentObject private var model: BookListViewModel
    var body: some View {
        VStack {
            if model.selectedBook != nil {
                BookDetailView(book: model.selectedBook)
            } else {
                QuoteView()
                BookControllerRepresentable()
                Divider()
                BookCollectionViewControllerRepresentable()
                    .frame(height: 100)

            }
        }
    }
}

struct BookSearchSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        BookSearchSwiftUI()
    }
}
