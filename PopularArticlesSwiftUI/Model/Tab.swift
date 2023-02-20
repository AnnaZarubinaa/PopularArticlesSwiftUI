//
//  Tab.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 15.02.2023.
//

import SwiftUI

enum Tab {
    
    case mostEmailed
    case mostShared
    case mostViewed
    case favorite
    
    func title() -> String {
        switch self {
        case .mostEmailed:
            return "Most emailed"
        case .mostShared:
            return "Most shared"
        case .mostViewed:
            return "Most viewed"
        case .favorite:
            return "Favorite"
        }
    }
    
    func icon() -> String {
        switch self {
        case .mostEmailed:
            return "envelope"
        case .mostShared:
            return "square.and.arrow.up"
        case .mostViewed:
            return "eye"
        case .favorite:
            return "star"
        }
    }
    
}
