//
//  ItemDTO+CoreDataClass.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/26/23.
//
//

import Foundation
import CoreData

@objc(ItemDTO)
public class ItemDTO: NSManagedObject {

    var model: ItemEntity {
        .init(id: self.id, name: self.name)
    }
}
