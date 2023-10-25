//
//  ItemRepository.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/25/23.
//

import CoreData

final class ItemRepository {
    
    static let shared = ItemRepository()
    
    private let container = NSPersistentContainer(name: "CoreData")
    private var context: NSManagedObjectContext {
        container.viewContext
    }
    
    private init() {
        loadStores()
    }
}

private extension ItemRepository {
    
    func loadStores() {
        container.loadPersistentStores(completionHandler: { _, _ in })
    }
    
    func save() {
        try? context.save()
    }
    
    func getAll() -> [Item] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let result = try? context.fetch(request)
        return result ?? []
    }
    
    func getItem<T: Equatable>(_ keyPath: WritableKeyPath<Item, T>, _ value: T) -> Item? {
        getAll().filter { $0[keyPath: keyPath] == value }.first
    }
}

extension ItemRepository {
    
    func create(_ item: ItemDTO) {
        let new = Item(context: context)
        new.id = item.id
        new.name = item.name
        self.save()
    }
    
    func edit(_ item: ItemDTO) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", item.id)
        let object = try? self.context.fetch(request).first
        object?.name = item.name
        self.save()
    }
    
    func getItem<T: Equatable>(_ keyPath: WritableKeyPath<ItemDTO, T>, _ value: T) -> ItemDTO? {
        self.getAllItems().filter { $0[keyPath: keyPath] == value }.first
    }
    
    func getAllItems() -> [ItemDTO] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let result = try? context.fetch(request).map { $0.dto }
        return result ?? []
    }
    
    func delete(_ item: ItemDTO) {
        let object: Item? = self.getItem(\.id, item.id)
        guard let object else { return }
        self.context.delete(object)
        self.save()
    }
}
