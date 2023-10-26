//
//  ItemRepository.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/25/23.
//

import CoreData

final class ItemRepository {
    
    private let db = CoreDataDB.shared
    
    private func getAll() -> [ItemDTO] {
        let request: NSFetchRequest<ItemDTO> = ItemDTO.fetchRequest()
        let result = try? db.context.fetch(request)
        return result ?? []
    }
    
    private func getItem<T: Equatable>(_ keyPath: WritableKeyPath<ItemDTO, T>, _ value: T) -> ItemDTO? {
        getAll().filter { $0[keyPath: keyPath] == value }.first
    }
}

extension ItemRepository: ItemRepositoriable {
    
    func create(_ item: ItemEntity) {
        let new = ItemDTO(context: db.context)
        new.id = item.id
        new.name = item.name
        db.save()
    }
    
    func edit(_ item: ItemEntity) {
        let request: NSFetchRequest<ItemDTO> = ItemDTO.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", item.id)
        let object = try? db.context.fetch(request).first
        object?.name = item.name
        db.save()
    }
    
    func getItem<T: Equatable>(_ keyPath: WritableKeyPath<ItemEntity, T>, _ value: T) -> ItemEntity? {
        self.getAllItems().filter { $0[keyPath: keyPath] == value }.first
    }
    
    func getAllItems() -> [ItemEntity] {
        let request: NSFetchRequest<ItemDTO> = ItemDTO.fetchRequest()
        let result = try? db.context.fetch(request).map { $0.model }
        return result ?? []
    }
    
    func delete(_ item: ItemEntity) {
        let object: ItemDTO? = self.getItem(\.id, item.id)
        guard let object else { return }
        db.context.delete(object)
        db.save()
    }
}
