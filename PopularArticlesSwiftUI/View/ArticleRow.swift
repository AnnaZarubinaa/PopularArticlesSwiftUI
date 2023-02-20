//
//  ArticleRow.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 15.02.2023.
//

import SwiftUI

struct ArticleRow: View {
    
    @Binding var article: ArticleModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(article.title)
                    .font(.system(size: 23))
                    .fontWeight(.heavy)
                    .lineLimit(2)
                
                if article.isFavorite {
                    Spacer()
                    Image(systemName: "star.fill")
                        .font(.system(size: 23))
                        .foregroundColor(.yellow)
                }
            }
        
            Text(article.author.uppercased())
                .font(.system(size: 13))
                .foregroundColor(.secondary)
            
            Text(article.shortPlot)
                .font(.system(size: 16))
                .lineLimit(3)
            
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color("ArticleRowBackground"))
        .cornerRadius(10)
    }
    
}

struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(article: .constant(ArticleModel.getMock()))
    }
}
