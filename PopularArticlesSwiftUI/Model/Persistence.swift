//
//  Persistence.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 15.02.2023.
//

import Foundation
import CoreData

struct PersistenseController {
    
    static var shared = PersistenseController()
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "ArticlesStore")
    
    init(inMemory: Bool = false) {
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
}
