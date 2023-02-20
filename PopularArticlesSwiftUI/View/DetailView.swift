//
//  DetailView.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 17.02.2023.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) var context
    
    @Binding var article: ArticleModel
    @State private var showingAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .font(.system(size: 25))
                .fontWeight(.heavy)
                .padding(.vertical, 3)
            
            Text(article.author.uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 3)
            
            Text(article.source.uppercased() + ", " + article.publishedDate)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(article.shortPlot)
                .font(.system(size: 16))
                .padding(.top, 10)
            
            Spacer()
            
        }
        .accentColor(.black)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .toolbar {
            Button(
                action: {
                    if !article.isFavorite {
                        self.setFavorite()
                    }
                },
                label: {
                    Group {
                        article.isFavorite ? Image(systemName: "star.fill") : Image(systemName: "star")
                    }.foregroundColor(.yellow)
                })
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Added to favourite"), dismissButton: .none
                    )
                }
        }
    }
    
    private func setFavorite() {
        article.isFavorite = true
        showingAlert.toggle()

        self.saveArticle()
        
    }
    
    func saveArticle() {
        let newArticle = Article(context: context)
        newArticle.id = article.id
        newArticle.author = article.author
        newArticle.title = article.title
        newArticle.publishedDate = article.publishedDate
        newArticle.shortPlot = article.shortPlot
        newArticle.source = article.source
        
        context.saveContext()
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(article: .constant(ArticleModel.getMock()))
    }
}
