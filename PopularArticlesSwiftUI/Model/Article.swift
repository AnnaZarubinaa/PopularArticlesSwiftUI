//
//  Article.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 18.02.2023.
//
//

import Foundation
import CoreData


public class Article: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var author: String?
    @NSManaged public var id: UUID?
    @NSManaged public var publishedDate: String?
    @NSManaged public var shortPlot: String?
    @NSManaged public var source: String?
    @NSManaged public var title: String?

}

extension Article : Identifiable {
    
}
