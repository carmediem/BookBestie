//
//  BookRowView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/7/22.
//
//MARK: -- THIS IS WHAT EACH ROW OF THE SEARCH RESULT SHOULD DISPLAY AS- book thumbnail, title, author, and a heart.
//TBD- if the heart button is tapped, it will add it to the favorites list. Otherwise, can add a button to add to favoriteBooKList

import SwiftUI

struct BookRowView: View {

  var book: BookInfo

  var body: some View {
    HStack {
//     Image(book.imageLinks.thumbnail)
//        .resizable()
//        .aspectRatio(contentMode: .fit)
//        .frame(width: 55)
//        .padding(.all, 18)
//        .shadow(color: Color.gray.opacity(0.3), radius: 20, x: 0, y: 20)

      VStack(alignment: .leading, spacing: 8) {
        Text(book.title)
         // .mainTitle()
          .lineLimit(2)
          .multilineTextAlignment(.leading)

        Text(book.authors)
        //      .secondaryTitle()
          .padding(.bottom, 6)
          
      } .frame(width: 200, height: 70, alignment: .leading)

        HStack {
          Image(systemName: "heart")
                .foregroundColor(.red)
        }
        .foregroundColor(.secondary)
        .font(.system(size: 30, weight: .medium))
    
      .frame(width: 50, height: 70, alignment: .leading)
    }
  }
}

struct DescriptionView_Previews: PreviewProvider {
  static var previews: some View {
    BookRowView(
        book: BookInfo(title: "Harry Potter and the Chamber of Secrets", authors: "JK Rowling", description: "Description of the book. This should be a couple of sentences", pageCount: 456, averageRating: 4.1, imageLinks: BookInfo.BookImage(
            thumbnail:URL(string: "http://books.google.com/books/content?id=XfFvDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!)))
  }
}
