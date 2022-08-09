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
        NavigationView {
        VStack {
            VStack(alignment: .center, spacing: 10) {
                
                ImageView(withURL: book.imageLinks?.thumbnail?.absoluteString ?? "")
                
                Text(book.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(8)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(book.authors?.first ?? "")
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
                  Text(book.description ?? "")
                }
            }
            .frame(width: .infinity, alignment: .leading)
            .padding(.all, 18)
        }
    }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                HStack {
                    NavigationLink {
                        BookNotesView()
                    } label: {
                        Image(systemName: "note.text")
                    }
                    NavigationLink {
                        DrawingContentView()
                    } label: {
                        Image(systemName: "paintpalette")
                
                        
                    }
                }
            }
        }
}
}
   
//struct BookDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookDetailView(book: BookInfo(from: ))
//    }
//}
