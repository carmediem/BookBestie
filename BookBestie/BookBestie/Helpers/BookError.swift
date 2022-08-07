//
//  BookError.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/2/22.
//

import Foundation

enum BookError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    case badResponse
    case noImage
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "The server failed to reach the necessary URL."
        case .thrownError(let error):
            return "Opps, there was an error: \(error.localizedDescription)"
        case .noData:
            return "The server failed to load any data."
        case .unableToDecode:
            return "There was an error when trying to load the data."
        case .badResponse:
            return "Bad response from API"
        case .noImage:
            return "Could not create UImage from data"
        }
    }
}
