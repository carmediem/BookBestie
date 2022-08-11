//
//  UICollectionViewRepresentable.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/9/22.
//

import SwiftUI
import Combine

struct BookCollectionViewControllerRepresentable: UIViewControllerRepresentable {
    
    @EnvironmentObject private var model: BookListViewModel
    
    func makeUIViewController(context: Context) -> BookCollectionViewController {
        
        let bookVc = BookCollectionViewController()
        bookVc.publisher
            .sink { action in
                switch action {
                case .transition:
                    break
                }
            }.store(in: &model.disposeBag)
        
        return bookVc
    }
    func updateUIViewController(_ uiViewController:
        BookCollectionViewController, context: Context) {}
}
