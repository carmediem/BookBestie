//
//  ContentView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//
import UIKit

class PokeViewController: UIViewController {
//MARK: - Views
    var pokeSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search a Book"
        searchBar.returnKeyType = .go
        return searchBar
    }()
    
    var pokeLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 12
        return stack
    }()
    
    var pokeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var pokeNameLabel: UILabel = {
        let label = UILabel()
        // TAMIC
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.text = "HELLO WORLD"
        return label
    }()
    
    var pokeSubLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addAllSubviews()
        pokeSearchBar.delegate = self
        constrainViews()
    }
    
    // MARK: - Helper Methods
    
    private func addAllSubviews() {
        view.addSubview(pokeSearchBar)
        // ADD VIEWS TO STACK
        pokeLabelStackView.addArrangedSubview(pokeImageView)
        pokeLabelStackView.addArrangedSubview(pokeNameLabel)
        pokeLabelStackView.addArrangedSubview(pokeSubLabel)
        // THEN ADD STACK TO VIEW
        view.addSubview(pokeLabelStackView)
    }
    
    private func constrainViews() {
        // Remeber ALL the 4 corners of the view.
        
        /*
                  Top
                 _____
        
                |     |
        Leading |     | Trailing
                |     |
                 _____
         
                 Bottom
        */
        
        NSLayoutConstraint.activate([
            pokeSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pokeSearchBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            pokeLabelStackView.topAnchor.constraint(equalTo: pokeSearchBar.bottomAnchor),
            pokeLabelStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            pokeLabelStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func fetchImage(book: BookInfo) {
        BookController.fetchImage(for: book) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.updateViews(with: book, image)
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    private func updateViews(with book: BookInfo, _ image: UIImage) {
        pokeSearchBar.text = ""
        pokeNameLabel.text = book.title.uppercased()
        pokeSubLabel.text = book.authors.uppercased()
        pokeImageView.image = image
    }
}

extension PokeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        BookController.fetchBookInfo(with: searchText.lowercased()) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let books):
                    self.fetchImage(book: books)
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}





//import SwiftUI
//
//
//struct ContentView: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//                 Image("BookImage")
//                     .resizable()
//                     .clipShape(RoundedRectangle(cornerRadius: 4))
//
//                 Text("Book Title")
//                     .font(.headline)
//
//                 Text("Author Name")
//                     .font(.body)
//                     .lineLimit(1)
//             }
//         }
//     }
//
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
