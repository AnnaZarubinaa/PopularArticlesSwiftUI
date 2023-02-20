//
//  FavoriteListView.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 18.02.2023.
//

import SwiftUI
import CoreData

struct FavoriteListView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Article.entity(), sortDescriptors: [], animation: .default)
    var results : FetchedResults<Article>
    
    var tab: Tab
    
    var body: some View {
        
        NavigationView {
            VStack {
                if results.isEmpty {
                    Text("No favorites")
                } else {
                    List {
                        ForEach(results) { article in
                            ZStack {
                                Text(article.title ?? "")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                NavigationLink(destination: {
                                    Text(article.title ?? "")
                                }) {
                                    EmptyView()
                                }
                                .opacity(0)
                            }
                            .contextMenu {
                                
                            }
                        }
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let article = results[index]
                                self.deleteArticle(article: article)
                            }
                        }
                        
                    }
                }
            }
            .navigationTitle(tab.title())
        }
        .accentColor(.black)
    }
    
    func deleteArticle(article: Article) {
        context.delete(article)
        context.saveContext()
    }
    
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListView(tab: .favorite)
    }
}
