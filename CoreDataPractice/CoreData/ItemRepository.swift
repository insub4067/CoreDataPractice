//
//  ItemRepository.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/25/23.
//

import CoreData

final class ItemRepository {
    
    private let db = CoreDataDB.shared
}

private extension ItemRepository {
    
    func getAll() -> [Item] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let result = try? db.context.fetch(request)
        return result ?? []
    }
    
    func getItem<T: Equatable>(_ keyPath: WritableKeyPath<Item, T>, _ value: T) -> Item? {
        getAll().filter { $0[keyPath: keyPath] == value }.first
    }
}

extension ItemRepository {
    
    func create(_ item: ItemDTO) {
        let new = Item(context: db.context)
        new.id = item.id
        new.name = item.name
        db.save()
    }
    
    func edit(_ item: ItemDTO) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", item.id)
        let object = try? db.context.fetch(request).first
        object?.name = item.name
        db.save()
    }
    
    func getItem<T: Equatable>(_ keyPath: WritableKeyPath<ItemDTO, T>, _ value: T) -> ItemDTO? {
        self.getAllItems().filter { $0[keyPath: keyPath] == value }.first
    }
    
    func getAllItems() -> [ItemDTO] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let result = try? db.context.fetch(request).map { $0.dto }
        return result ?? []
    }
    
    func delete(_ item: ItemDTO) {
        let object: Item? = self.getItem(\.id, item.id)
        guard let object else { return }
        db.context.delete(object)
        db.save()
    }
}
