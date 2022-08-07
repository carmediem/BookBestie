//
//  MainPageView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//

//MARK: -- THIS IS WHAT EACH CELL WILL LOOK LIKE IN THE UIVIEWCOLLECTION FOR THE THREE - FIVE FAVORITE BOOKS

import SwiftUI
import UIKit

struct Card: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
        Image("harrypotter")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 4))
            Text("Harry Potter")
                .font(.headline)
            Text("JK Rowling")
                .font(.body)
        }
    }
}
