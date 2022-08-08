//
//  BookDetailView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/3/22.
//

//MARK: -- This is the view where the user can click into to see additional details of the book. The user will navigate to this page view after they click on the search result.
//navigation link from search result text field to this view.
//The favorite button can be here. Clicking it will add it to the favorite list

import SwiftUI

struct BookDetailView: View {
    
   var book: BookInfo

    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 10) {
//                ImageView(withURL: book.imageLinks?.thumbnail)
                
                
//                Image(book.imageLinks?.thumbnail)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 100, height: 100)
//                    .padding(.all, 20)

                Text(book.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(8)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(book.authors?.first ?? "No author found")
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
                    Text(book.description ?? "No description found")
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
