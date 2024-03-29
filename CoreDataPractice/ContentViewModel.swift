//
//  ContentViewModel.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/25/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    private let repository: ItemRepositoriable
    
    init(repository: ItemRepositoriable = ItemRepository()) {
        self.repository = repository
    }
    
    func onAppear() {
        
        let new = ItemEntity(id: 1, name: "name")
        repository.create(new)
        
        let edited = new.with(\.name, "new name")
        repository.edit(edited)
        
        let items = repository.getAllItems()
        dump(items)
        
        if let item = repository.getItem(\.id, 1) {
            repository.delete(item)
        }
        
        let result = repository.getAllItems()
        dump(result)
    }
}
