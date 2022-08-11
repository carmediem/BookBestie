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
    
    let persistentContainer = PersistenceController.shared.container
    
    //this is happening in the main thread. View Context displays the views
    func saveContext(context: NSManagedObjectContext) {
        //this is the same as saying dispatch.. sync(will wait until the task is done). Perform and wait until im done. All the work needs to be done in the block. Anytime we save, we'll pss in the new context
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
        let context = persistentContainer.newBackgroundContext()
        context.perform { [self] in
            let drawing = DrawingDoc(entity: DrawingDoc.entity(), insertInto: context)
            drawing.data = doc.data
            drawing.id = doc.id
            drawing.name = doc.name
            self.saveContext(context: context)
        }
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
        let predicate = NSPredicate(format: "id = %@", data.id  as CVarArg)
        request.predicate = predicate
        if let results = try? persistentContainer.viewContext.fetch(request) {
            let obj = results.first
            obj?.setValue(data.data, forKey: "data")
            saveContext(context: persistentContainer.viewContext)
        }
    }
    
    func deleteData(data: DrawingDocument) {
        let request: NSFetchRequest<DrawingDoc> = DrawingDoc.fetchRequest()
        request.includesPropertyValues = false
        let predicate = NSPredicate(format: "id = %@", data.id as CVarArg)
        request.predicate = predicate
        if let results = try? persistentContainer.viewContext.fetch(request).first {
            persistentContainer.viewContext.delete(results)
            saveContext(context: persistentContainer.viewContext)
        }
    }
}

