//
//  BookAPI.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//

import Foundation
import UIKit.UIImage

//https://www.googleapis.com/books/v1/volumes?q=fantastic+beasts
//

class BookController {
    
    static let baseURL = URL(string: "https://www.googleapis.com/books/v1/volumes")
    
    //   static let searchBookComponent =
    
    static let searchTermKey = "q"
    
    static let searchTermValue = ""
    
    
    
    static func fetchBookInfo(with searchterm: String, completion: @escaping (Result<[BookInfo], BookError>) -> Void) {
        
        //Step1: URL
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let searchTermQuery = URLQueryItem(name: searchTermKey, value: searchterm)
        
        components?.queryItems = [searchTermQuery]
        
        guard let finalURL = components?.url else { return completion(.failure(.invalidURL)) }
        print(finalURL)
        
        
        //Step 2: Data task
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            
            //Step 3: error handling
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return completion(.failure(.badResponse))
            }
            //Step 4: guard check for data
            guard let data = data else { return completion(.failure(.noData))
            }
            
            //Step 5: Decode
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let secondLevelObject = topLevelObject.items
                
                
                var arrayOfBooks: [BookInfo] = []
                
                for dictionary in secondLevelObject {
                    let book = dictionary.volumeInfo
                    arrayOfBooks.append(book)
                }
                
                return completion(.success(arrayOfBooks))
            } catch {
                print(error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
        
        //MARK: -- Image URL
        
        static func fetchImage(for book: BookInfo, completion: @escaping (Result<UIImage, BookError>) -> Void) {
            guard let imageURL = book.imageLinks?.thumbnail else {return}

            URLSession.shared.dataTask(with: imageURL) { data, _, error in
                if let error = error {
                    print("There was an error ftching the image")
                    return completion(.failure(.thrownError(error)))
                }
                
                guard let data = data else { return completion(.failure(.noData)) }
                
                guard let image = UIImage(data: data) else { return completion(.failure(.noImage)) }
                completion(.success(image))
            }.resume()
        }
        
}//end of class
