//
//  CoreDataManager.swift
//  BookBestie
//
//  Created by Yvana Pham on 8/8/22.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DrawingDocModel")
        container.loadPersistentStores { (storeDesc, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addData(doc: DrawingDocument) {
        let drawing = DrawingDoc(context: persistentContainer.viewContext)
        drawing.data = doc.data
        drawing.id = doc.id
        drawing.name = doc.name
        
        saveContext()
    }
    
    func getData() -> [DrawingDocument] {
        let request: NSFetchRequest<DrawingDoc> = DrawingDoc.fetchRequest()
        request.returnsObjectsAsFaults = false
        var fetchResults = [DrawingDocument]()
        
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            for data in result {
                fetchResults.append(DrawingDocument(id: data.id ?? UUID(), data: data.data ?? Data(), name: data.name ?? ""))
            }
        } catch {
            print("Fetching failed")
        }
        
        return fetchResults
    }
    
    func updateData(data: DrawingDocument) {
        let request: NSFetchRequest<DrawingDoc> = DrawingDoc.fetchRequest()
        let predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        request.predicate = predicate
        do {
            let results = try persistentContainer.viewContext.fetch(request)
            let obj = results.first
            obj?.setValue(data.data, forKey: "data")
            saveContext()
        } catch {
            print("Error saving document update.")
        }
    }
    
    func deleteData(data: DrawingDocument) {
        let request: NSFetchRequest<DrawingDoc> = DrawingDoc.fetchRequest()
        request.includesPropertyValues = false
        let predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        request.predicate = predicate
        
        do {
            let results = try persistentContainer.viewContext.fetch(request)
            for item in results {
                persistentContainer.viewContext.delete(item)
            }
            
            saveContext()
        } catch {
            print("Error deleting document from database")
        }
    }
}


