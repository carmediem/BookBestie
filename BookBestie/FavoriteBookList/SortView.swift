//
//  SortView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/4/22.
//

import SwiftUI

struct SortView: View {
    
    @ObservedObject var bookListViewModel: BookListViewModel
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 20) {
            Text("Sort By")
            Button {
        //       bookListViewModel.sortbyTitle()
            } label: {
            Text("Title")
            }.buttonStyle(.bordered)
       
            
            Button {
          //     bookListViewModel.sortByAuthor()
            } label: {
            Text("Author")
            }.buttonStyle(.bordered)
        }
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView(bookListViewModel: BookListViewModel())
    }
}
