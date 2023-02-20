//
//  ArticlesListView.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 15.02.2023.
//

import SwiftUI
import Alamofire

struct ArticlesListView: View {
    
    @StateObject var viewModel = ArticlesViewModel()
    
    var tab: Tab
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.articles.isEmpty {
                    ProgressView()
                        .onAppear {
                            viewModel.fetchData(for: tab)
                        }
                } else {
                    List {
                        ForEach($viewModel.articles) { $article in
                            ZStack {
                                ArticleRow(article: $article)
                                
                                NavigationLink(destination: {
                                    DetailView(article: $article)
                                }) {
                                    EmptyView()
                                }
                                .opacity(0)
                            }
                            .contextMenu {
                                
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(tab.title())
        }
        .accentColor(.black)
    }
    
}

struct MostSharedView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListView(tab: .mostShared)
    }
}
