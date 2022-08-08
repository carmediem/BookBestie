//
//  DrawingDocument.swift
//  BookBestie
//
//  Created by Yvana Pham on 8/8/22.
//

import Foundation

struct DrawingDocument: Identifiable {
    let id: UUID
    var data: Data
    var name: String
}
