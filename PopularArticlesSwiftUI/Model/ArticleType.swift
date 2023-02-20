//
//  ArticleType.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 18.02.2023.
//

import Foundation

enum ArticleType: Int {
    
    case mostEmailed = 0
    case mostShared = 1
    case mostViewed = 2
    
    func url() -> String {
        switch self {
        case .mostEmailed:
            return "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=UXxMypAorN0RUqFiFbG8WUkHvOXOOdAW"
        case .mostShared:
            return "https://api.nytimes.com/svc/mostpopular/v2/shared/30.json?api-key=UXxMypAorN0RUqFiFbG8WUkHvOXOOdAW"
        case .mostViewed:
            return "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=UXxMypAorN0RUqFiFbG8WUkHvOXOOdAW"
        }
    }
    
}
