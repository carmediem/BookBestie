//
//  BookCollectionViewCell.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/4/22.
//

import SwiftUI
import UIKit

//this embeds the Card inside a UICollectionView Cell

class BookCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier = "BookCollectionViewCell"
    
    
    lazy var host: UIHostingController = {
        return UIHostingController(rootView: Card(book: BookInfo.init(title: "")))
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        host.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(host.view)
        
        NSLayoutConstraint.activate([
            host.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            host.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            host.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            host.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    #warning("added these")
    func embed(in parent: UIViewController) {
        parent.addChild(host)
        host.didMove(toParent: parent)
        print("CollectionViewCell is added to UIViewController")
    }
    deinit {
        host.willMove(toParent: nil)
        host.view.removeFromSuperview()
        host.removeFromParent()
    }
}
