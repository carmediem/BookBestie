//
//  QuoteViewModel.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/5/22.
//

import Foundation
import SwiftUI

class QuoteViewModel: ObservableObject {
//  @State var quotes = [Quote]()
    @Published private var quote: [Quote]?
    
    var quoteContent: String {
        guard let q = quote?.first?.q else {
            return ""
        }
        return q
    }
    
    var author: String {
        guard let a = quote?.first?.a else {
            return ""
        }
        return a
    }

        func getQuotesData() {
        QuoteAPI.getQuote { (result) in
            switch result {
            case .success(let quote):
                DispatchQueue.main.async {
                    self.quote = quote
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
