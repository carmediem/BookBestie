//
//  MainPageView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//

//MARK: -- THIS IS WHAT EACH CELL WILL LOOK LIKE IN THE UIVIEWCOLLECTION FOR THE THREE - FIVE FAVORITE BOOKS

import SwiftUI

struct Card: View {
    
    var book: BookInfo
    #warning("ask erich if this needs a forEach or call the favbooklistview")
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
      ImageView(withURL: book.imageLinks?.thumbnail?.absoluteString ?? "")
           // Image("bookbestie")
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 4))
          //  Text("Harry Potter")
            Text(book.title)
                .font(.headline)

         // Text("JK Rowling")
        Text(book.authors?.first ?? "")
                .font(.body)
        }
    }
}


struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(book: BookInfo.init(title: ""))
    }
}
