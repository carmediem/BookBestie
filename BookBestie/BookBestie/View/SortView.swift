//
//  SortView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/4/22.
//

import SwiftUI

struct SortView: View {
    
//    @ObservedObject var favoriteBookListViewModel: FavoriteBookListViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Button {
          //      favoriteBookListViewModel.sortbyTitle()
            } label: {
                Text("Title")
            } .buttonStyle(.bordered)
            
            Button {
           //     favoriteBookListViewModel.sortbyAuthor()
            } label: {
                Text("Author")
            } .buttonStyle(.bordered)
        }
    }
}
