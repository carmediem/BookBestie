//
//  SortView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/4/22.
//

import SwiftUI

struct SortView: View {
    @EnvironmentObject var bookListViewModel: BookListViewModel

    var body: some View {
        
        HStack {
            Text("Sort By")
                .fontWeight(.regular)
            
            Button {
                bookListViewModel.sortbyTitle()
            } label: {
                Text("Title")
            }.buttonStyle(.bordered)
            
            Button {
                bookListViewModel.sortByAuthor()
            } label: {
                Text("Author")
            }.buttonStyle(.bordered)

            
            Button(action: {
                bookListViewModel.sortFavs()
            }, label: {
                Image(systemName: "heart.fill")
            })
            .padding(10)
        }
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}
