//
//  BookRowView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//

//MARK: -- THIS IS WHAT EACH ROW OF THE SEARCH RESULT SHOULD DISPLAY AS- book thumbnail, title, author, and a heart.
//TBD- if the heart button is tapped, it will add it to the favorites list. Otherwise, can add a button to add to favoriteBooKList

import SwiftUI

struct BookRowView: View {
    
    var book: BookInfo
     
     var body: some View {
         HStack {
 //            Image(book.imageLinks)
 //                .resizable()
 //                .aspectRatio(contentMode: .fit)
 //                .frame(width: 100, height: 150)
             
             VStack(alignment: .leading) {
                 Text(book.title)
                     .fontWeight(.bold)
                     .padding(4)
                     .lineLimit(1)
                     .multilineTextAlignment(.leading)
                 
                 Text(book.authors)
                     .fontWeight(.semibold)
                     .padding(6)
                 
                 HStack {
                     Image(systemName: "heart")
                 
                     
                 }
             }
             .frame(width: 200, height: 200, alignment: .leading)
         }
         }
     }

//struct BookRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookRowView(book: BookInfo(title: <#T##String#>, authors: <#T##String#>, description: <#T##String#>, pageCount: <#T##Int#>, averageRating: <#T##Double#>, imageLinks: <#T##BookInfo.BookImage#>))
//    }
//}