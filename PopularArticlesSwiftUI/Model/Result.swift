//
//  Result.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 15.02.2023.
//

import SwiftUI

struct Returned: Codable {
    
    let count: Int
    let articles: [Result]
    
    enum CodingKeys: String, CodingKey {
        case count = "num_results"
        case articles = "results"
    }
    
}

struct Result: Codable {
    
    var source: String
    var publishedDate: String
    var author: String
    var title: String
    var shortPlot: String
    
    enum CodingKeys: String, CodingKey {
        case source
        case publishedDate = "published_date"
        case author = "byline"
        case title
        case shortPlot = "abstract"
    }
    
}
