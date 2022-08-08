//
//  BookSearchExtension.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/4/22.
//

import Foundation

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}


//ask Laura to update the BookAPI to have the value be value: searchterm.trimmed())
