//
//  BookSearchSwiftUI.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/8/22.
//

import SwiftUI

struct BookSearchSwiftUI: View {
    var body: some View {
        VStack {
            //put UICollectionView here
       
    BookControllerRepresentable()
    BookCollectionViewControllerRepresentable()
            QuoteView()
        }
    }
}

struct BookSearchSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        BookSearchSwiftUI()
    }
}
