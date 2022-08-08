//
//  QuoteAPI.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/5/22.
//

import Foundation
import SwiftUI

class QuoteAPI {
    static private let baseURL = URL(string: "https://zenquotes.io/api/today/")
    
    static func getQuote(completion: @escaping (Result<[Quote], BookError>) -> Void) {
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
        
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData)) }
            do {
                let quote = try JSONDecoder().decode([Quote].self, from: data)
                return completion(.success(quote))
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
        
    }
    }
    
//https://zenquotes.io/api/today/
   
