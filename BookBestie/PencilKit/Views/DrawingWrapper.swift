//
//  DrawingWrapper.swift
//  BookBestie
//
//  Created by Yvana Pham on 8/8/22.
//

import SwiftUI

struct DrawingWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = DrawingViewController
    
    var manager: DrawingManager
    var id: UUID
    
    func makeUIViewController(context: Context) -> DrawingViewController {
        let viewController = DrawingViewController()
        viewController.drawingData = manager.getData(for: id)
        viewController.drawingChanged = { data in
            manager.update(data: data, for: id)
        }
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: DrawingViewController, context: Context) {
        uiViewController.drawingData = manager.getData(for: id)
    }
}

