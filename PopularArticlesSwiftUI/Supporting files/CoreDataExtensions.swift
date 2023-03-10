//
//  CoreDataExtensions.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 18.02.2023.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func saveContext() {
        if self.hasChanges {
            do {
                try self.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
