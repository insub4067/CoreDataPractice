//
//  ItemRepositoriable.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/25/23.
//

import Foundation

protocol ItemRepositoriable {
    
    func create(_ item: ItemEntity)
    func edit(_ item: ItemEntity)
    func getItem<T: Equatable>(_ keyPath: WritableKeyPath<ItemEntity, T>, _ value: T) -> ItemEntity?
    func getAllItems() -> [ItemEntity]
    func delete(_ item: ItemEntity)
}
