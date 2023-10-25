//
//  ItemDTO+CoreDataClass.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/25/23.
//
//

import Foundation
import CoreData

@objc(Item)
public class ItemDTO: NSManagedObject {

    var map: ItemEntity {
        .init(id: self.id, name: self.name)
    }
}
