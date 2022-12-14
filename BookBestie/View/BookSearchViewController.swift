//
//  BookSearchViewController.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/8/22.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class BookSearchViewController: UIViewController {
    
    enum Action {
        case move(book: BookInfo)
    }
    
    public var publisher = PassthroughSubject<(Action), Never>()
    
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
        tableView.isUserInteractionEnabled = true
        tableView.allowsSelection = true
        stackView.addArrangedSubview(tableView)
    }
}

extension BookSearchViewController: UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        publisher.send(.move(book: book))
//        let hostingController = UIHostingController(rootView: BookDetailView(book: book))
//        show(hostingController, sender: self)
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
        
        BookController.fetchBookInfo(with: searchTerm) { result in
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
    @EnvironmentObject private var model: BookListViewModel
      
    func makeUIViewController(context: Context) -> BookSearchViewController {
        let bookSearchVC = BookSearchViewController()
        bookSearchVC.publisher
            .sink { action in
                switch action {
                    case .move(let book):
                    model.selectedBook = book
                }
            }.store(in: &model.disposeBag)
        return bookSearchVC
    }
    
    func updateUIViewController(_ uiViewController: BookSearchViewController, context: Context) {}
    
}
