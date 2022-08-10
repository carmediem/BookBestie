//
//  BookCollectionViewController.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/4/22.
//

//NEED TO BE SWIFTUI FRIENDLY.
//THIS IS THE UICOLLECTIONVIEW THAT WILL BE ON THE CONTENT PAGE UNDER THE SEARCH BAR

import SwiftUI
import UIKit


class BookCollectionViewController: UIViewController {
 
//    var completionHandler: ((BookInfo) -> Void)?
//    init(transitionAction: @escaping (BookInfo) -> Void) {
//        super.init(nibName: nil, bundle: nil)
//        self.completionHandler = transitionAction
//    }
    
  
    //Collection View of favorite books with a horizontal scroll director
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //This will be the label for favorite books
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Your favorite books"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Button to navigate to FavBookListView. ADD SOME CONSTRAINTS TO THIS
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        button.setTitleColor(.black, for: .normal)
        button.setTitle("See All →", for: .normal)
        button.contentHorizontalAlignment = .trailing
        return button
        
    }()
    func setupButtons() {
    button.addTarget(self, action: #selector(transitionButtonTapped(sender:)), for: .touchUpInside)
    }
                                                                                
    @objc func transitionButtonTapped(sender: UIButton) {
     //   transitionAction()
        print("button tapped")
//        let hostingController = UIHostingController(rootView: FavBookListView())
//        navigationController?.pushViewController(hostingController, animated: true)
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: BookCollectionViewCell.reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
//        view.addSubview(label)
//        view.addSubview(collectionView)
        view.addSubview(button)
        button.isUserInteractionEnabled = true
        
        #warning("button isnt showing up")
        NSLayoutConstraint.activate( [
//            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            label.heightAnchor.constraint(equalToConstant: 24),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
//            collectionView.heightAnchor.constraint(equalToConstant: 320),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 18),
        
        ])
    }
}

extension BookCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else {
            fatalError("There was an error dequeing the cell")
        }
        return cell
    }
}

extension BookCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 320)
    }
}




//#warning("follow up with Erich")
//func makeCoordinator() -> Coordinator {
//    return Coordinator
//}


extension BookCollectionViewController {
    class Coordinator: NSObject, ObservableObject {
    //    @ObservedObject var model:
        
     //   init(book: BookDataStore)
    }
}

