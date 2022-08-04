//
//  BookDetailView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/3/22.
//


import SwiftUI

struct BookDetailView: View {
    
   var book: BookInfo

    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 10) {
//                Image(book.imageLinks)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 100, height: 100)
//                    .padding(.all, 20)
//
                Text(book.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(8)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(book.authors)
                    .fontWeight(.medium)
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 9)
            }
                 
           Spacer()
            VStack(alignment: .leading, spacing: 16) {
                Text("Description")
                    .fontWeight(.bold)
              
    
                ScrollView(showsIndicators: false) {
                  Text(book.description)
                }
            }
            .frame(width: .infinity, alignment: .leading)
            .padding(.all, 18)
        }
    }
}
    
   
//struct BookDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookDetailView(book: BookInfo())
//    }
//}
