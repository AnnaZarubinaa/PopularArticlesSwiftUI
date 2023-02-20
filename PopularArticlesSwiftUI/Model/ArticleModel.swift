//
//  ArticleModel.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 19.02.2023.
//

import Foundation

struct ArticleModel: Identifiable {
    
    var id = UUID()
    var source: String
    var publishedDate: String
    var author: String
    var title: String
    var shortPlot: String
    var isFavorite: Bool
    
}

extension ArticleModel {
    
    static func getMock() -> ArticleModel {
        return ArticleModel(
            source: "New York Times",
            publishedDate: "22.09.2022",
            author: "By Susan Dominus",
            title: "Women Have Been Misled About Menopause",
            shortPlot: "Hot flashes, sleeplessness, pain during sex: For some of menopause’s worst symptoms, there’s an established treatment. Why aren’t more women offered it?",
            isFavorite: true
        )
    }
    
}
