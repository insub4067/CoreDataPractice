//
//  ItemRepositoriable.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/25/23.
//

import Foundation

protocol ItemRepositoriable {
    
    func create(_ item: ItemDTO)
    func edit(_ item: ItemDTO)
    func getItem<T: Equatable>(_ keyPath: WritableKeyPath<ItemDTO, T>, _ value: T) -> ItemDTO?
    func getAllItems() -> [ItemDTO]
    func delete(_ item: ItemDTO)
}
