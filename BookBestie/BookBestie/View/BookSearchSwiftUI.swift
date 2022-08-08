//
//  BookSearchSwiftUI.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/7/22.
//

import Foundation

import SwiftUI

struct BookSearchSwiftUI: View {
    var body: some View {
        VStack {
            //put UICollectionView here
       
    BookControllerRepresentable()
    QuoteView()
        }
    }
}

struct BookSearchSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        BookSearchSwiftUI()
    }
}
