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

    @EnvironmentObject var bookListViewModel: BookListViewModel

  var body: some View {
    HStack {
        ImageView(withURL: book.imageLinks?.thumbnail?.absoluteString ?? "")

      VStack(alignment: .leading, spacing: 8) {
        Text(book.title)
         // .mainTitle()
          .lineLimit(2)
          .multilineTextAlignment(.leading)

          Text(book.authors?.first ?? "")
        //      .secondaryTitle()
          .padding(.bottom, 6)
          

      } .frame(width: 150, height: 70, alignment: .leading)
        
        HStack {
            Image(systemName: bookListViewModel.contains(book) ? "heart.fill" : "heart")
                .foregroundColor(.red)
                .onTapGesture {
                bookListViewModel.toggleFav(book: book)
                }
        }
        .foregroundColor(.secondary)
        .font(.system(size: 30, weight: .medium))
    
      .frame(width: 30, height: 50, alignment: .leading)
    }
  }
}

struct DescriptionView_Previews: PreviewProvider {
  static var previews: some View {
    BookRowView(
        book: BookInfo(title: "Harry Potter and the Chamber of Secrets", authors: ["JK Rowling"], description: "Description of the book. This should be a couple of sentences", pageCount: 456, averageRating: 4.1, imageLinks: BookInfo.BookImage(
            thumbnail:URL(string: "http://books.google.com/books/content?id=XfFvDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!)))
  }
}
