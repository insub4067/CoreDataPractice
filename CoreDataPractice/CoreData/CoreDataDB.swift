//
//  CoreDataDB.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/25/23.
//

import CoreData

class CoreDataDB {
    
    static let shared = CoreDataDB()
    
    private let container = NSPersistentContainer(name: "CoreData")
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    private init() {
        loadStores()
    }
    
    func loadStores() {
        container.loadPersistentStores(completionHandler: { _, _ in })
    }
    
    func save() {
        try? context.save()
    }
}
