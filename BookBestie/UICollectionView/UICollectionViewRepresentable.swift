//
//  UICollectionViewRepresentable.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/9/22.
//

import Foundation
import SwiftUI


struct BookCollectionViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> BookCollectionViewController {
        return BookCollectionViewController()
    }
    func updateUIViewController(_ uiViewController:
        BookCollectionViewController, context: Context) {}
}

