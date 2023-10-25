//
//  Item+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/25/23.
//
//

import Foundation
import CoreData

extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?

    var dto: ItemDTO {
        .init(id: self.id, name: self.name)
    }
}

extension Item : Identifiable {

}
