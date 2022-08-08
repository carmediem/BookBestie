//
//  BookSearchVIewController.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/7/22.
//

import Foundation
import UIKit
import SwiftUI

//UIViewControllerRepresentable??

class BookSearchViewController: UIViewController {
    
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    var books: [BookInfo] = []
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 12
        return stack
    }()
    
    var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.placeholder = "Search for a book"
        bar.returnKeyType = .go
        return bar
    }()
    
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        configureSearchBar()
        configureTableView()
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    func configureSearchBar() {
        searchBar.delegate = self
        stackView.addArrangedSubview(searchBar)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "bookCell")
        tableView.allowsSelection = false
        stackView.addArrangedSubview(tableView)
    }
}

extension BookSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "bookCell")
        let book = books[indexPath.row]
        
        BookController.fetchImage(for: book) {result in
            DispatchQueue.main.async {
                switch result {
                case.success(let thumbnail):
                    cell.imageView?.image = thumbnail
                case.failure(_):
                    print("We did not get an image")
                }
                cell.textLabel?.text = book.title
                cell.detailTextLabel?.text = book.authors?.first }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}


extension BookSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text,
              !searchTerm.isEmpty else { return }
        searchBar.resignFirstResponder()
        
        BookController.fetchBookInfo(with: searchTerm.trimmed()) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let books):
                    self.books = books
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct BookControllerRepresentable: UIViewControllerRepresentable {
  
    
    
    func makeUIViewController(context: Context) -> BookSearchViewController {
        let bookSearchVC = BookSearchViewController()
        return bookSearchVC
    }
    
    func updateUIViewController(_ uiViewController: BookSearchViewController, context: Context) {}
    
}



