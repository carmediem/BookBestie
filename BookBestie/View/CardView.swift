//
//  MainPageView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//


import SwiftUI
import UIKit


struct Card: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
                 Image("BookImage")
                     .resizable()
                     .clipShape(RoundedRectangle(cornerRadius: 4))

                 Text("Book Title")
                     .font(.headline)

                 Text("Author Name")
                     .font(.body)
                     .lineLimit(1)
             }
         }
     }


