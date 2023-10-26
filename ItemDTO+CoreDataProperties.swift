//
//  ItemDTO+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/26/23.
//
//

import Foundation
import CoreData


extension ItemDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemDTO> {
        return NSFetchRequest<ItemDTO>(entityName: "ItemDTO")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?

}

extension ItemDTO : Identifiable {

}
