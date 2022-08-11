//
//  MainPageView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//

import SwiftUI

protocol CardContent {
    var title: String { get }
    var authors: [String] { get }
    var imageLinks: URL { get }
}

struct Card: View {
    #warning("added in protocol CardContent and type alias")
    
    typealias Content = CardContent
    
    let content = Content.self
  
    
    var book: BookInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
//     ImageView(withURL: book.imageLinks?.thumbnail?.absoluteString ?? "")
            Image("bookbestie")
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 4))
           Text("Harry Potter")
//          Text(book.title)
                .font(.headline)

          Text("JK Rowling")
//        Text(book.authors?.first ?? "")
                .font(.body)
        }
    }
}


struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(book: BookInfo.init(title: ""))
    }
}
