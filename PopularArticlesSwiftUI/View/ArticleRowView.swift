//
//  ArticleRowView.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 18.02.2023.
//

import SwiftUI

struct ArticleRowView: View {
   
    var title: String
    var author: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 23))
                .fontWeight(.heavy)
                .lineLimit(2)
        
            Text(author.uppercased())
                .font(.system(size: 13))
                .foregroundColor(.secondary)
            
            Text(text)
                .font(.system(size: 16))
                .lineLimit(3)
            
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color("ArticleRowBackground"))
        .cornerRadius(10)
    }
    
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(
            title: ArticleModel.getMock().title,
            author: ArticleModel.getMock().author,
            text: ArticleModel.getMock().shortPlot
        )
    }
}
