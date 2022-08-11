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
    
    @State var book: BookInfo?
    
    var favoriteBook: CDFavoriteBook?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background4").edgesIgnoringSafeArea(.all)
                VStack {
                    VStack(alignment: .center, spacing: 10) {
                        
                        ImageView(withURL: book?.imageLinks?.thumbnail?.absoluteString ?? "")
                        
                        Text(book?.title ?? "")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(8)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text(book?.authors?.first ?? "")
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
                            Text(book?.description ?? "")
                        }
                    }
                    .frame(width: 340, alignment: .leading)
                    .padding(.all, 18)
                }
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
        .onAppear {
            // MARK: Create, and set the book info here. Try doing this in the BookRowView as the last step. Then, you can use the BookRowView instead of just text, in the list of favorites.
            if let favoriteBook = favoriteBook {
                let currentBook = BookInfo.make(from: favoriteBook)
                self.book = currentBook
            }
        }
    }
}
