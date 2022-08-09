//
//  BookRep.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/8/22.
//

import Foundation
import SwiftUI


struct BookDetailViewRepresentable: UIViewControllerRepresentable {
    
    //var transitionAction

    var book: BookInfo
    
    init(book: BookInfo) {
        self.book = book
    }
    
    func makeCoordinator() -> BookDetailViewRepresentable.Coordinator {
        let coordinator = Coordinator(book: book)
        return coordinator
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = BookSearchViewController()
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    class Coordinator: NSObject, ObservableObject {
        var book: BookInfo
        init(book: BookInfo) {
            self.book = book
        }
    }
}
