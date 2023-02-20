//
//  ArticlesViewModel.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 15.02.2023.
//

import SwiftUI
import CoreData
import Alamofire

class ArticlesViewModel: ObservableObject {
    
    @Published var articles = [ArticleModel]()
    
    func fetchData(for tab: Tab) {
        self.clearSavedData()
        
        var articleType: ArticleType
        
        switch tab {
        case .mostEmailed:
            articleType = .mostEmailed
        case .mostShared:
            articleType = .mostShared
        case .mostViewed:
            articleType = .mostViewed
        case .favorite:
            return
        }
        
        guard let url = URL(string: articleType.url()) else {
            return
        }

        AF.request(url)
            .validate()
            .responseDecodable(of: Returned.self) { (response) in
                switch response.result {
                case .success(let result):
                    self.convertToModel(result: result.articles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func convertToModel(result: [Result]) {
        for item in result {
            let newArticle = ArticleModel(
                source: item.source,
                publishedDate: item.publishedDate,
                author: item.author,
                title: item.title,
                shortPlot: item.shortPlot,
                isFavorite: false
            )
            self.articles.append(newArticle)
        }
    }
    
    func clearSavedData() {
        let fetchRequest: NSFetchRequest<Article>
        fetchRequest = Article.fetchRequest()

        fetchRequest.includesPropertyValues = false

        let context = PersistenseController.shared.container.viewContext

        do {
            let objects = try context.fetch(fetchRequest)
            for object in objects {
                context.delete(object)
            }
        } catch let error as NSError{
            print(error)
        }
        
        context.saveContext()
    }
    
}
