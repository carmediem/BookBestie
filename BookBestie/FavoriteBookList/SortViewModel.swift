//
//  SortViewModel.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/7/22.
//

import SwiftUI

//MARK: -- Sort functions for the buttons in the BookListView

class SortViewModel: ObservableObject {
  @Published var filteredBooks = [BookInfo]()
    
    func sortbyTitle() {
        filteredBooks = filteredBooks.sorted {
            return $0.title < $1.title
        }
    }
    
    func sortByAuthor() {
        filteredBooks = filteredBooks.sorted {
            return $0.authors < $1.authors
        }
    }
}

