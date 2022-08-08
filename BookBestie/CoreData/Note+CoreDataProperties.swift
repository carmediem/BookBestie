//
//  Note+CoreDataProperties.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/7/22.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var content: String?
    @NSManaged public var title: String?
    @NSManaged public var id: UUID?

}

extension Note : Identifiable {

}
