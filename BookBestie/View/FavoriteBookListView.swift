//
//  FavoriteBookListView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/4/22.
//

import SwiftUI
import UIKit

struct FavoriteBookListView: View {
    var body: some View {
        //The section will have the two sort by buttons. These buttons will be part of the header and will not scroll
       // Section(header: SortView(favoriteBookListViewModel: viewModel)) {
   Text("Hello World")
     
        }
            
            //need the favorited books to be listed in a List with a forEach. Will need a navigation link to the BookDetail View that will show the details of the book

}


struct FavoriteBookListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteBookListView()
    }
}
