//
//  FavKeyViewModel.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/8/22.
//

import Foundation

final class FavKeyViewModel {
    private let FAV_KEY = "fav_key"
    
    func save(items: Set<String>) {
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
    func load() -> Set<String> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [String] ?? [String]()
        return Set(array)
    }
}
