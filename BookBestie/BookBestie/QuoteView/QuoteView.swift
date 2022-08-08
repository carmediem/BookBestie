//
//  QuoteView.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/5/22.
//

import SwiftUI

struct QuoteView: View {
    @ObservedObject private var vm = QuoteViewModel()
    
    var body: some View {
        VStack {
            Text("\(self.vm.quoteContent)")
                .italic()
                .font(.subheadline)
            Text("\(self.vm.author)")
                .font(.subheadline)
            }
        .padding()
        .onAppear() {
            self.vm.getQuotesData()
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
