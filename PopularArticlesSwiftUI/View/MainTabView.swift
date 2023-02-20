//
//  MainTabView.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 15.02.2023.
//

import SwiftUI

struct MainTabView: View {

    var body: some View {

        TabView {
            ArticlesListView(tab: .mostShared)
                .tabItem {
                    Text(Tab.mostShared.title())
                    Image(systemName: Tab.mostShared.icon())
                }
            
            ArticlesListView(tab: .mostViewed)
                .tabItem {
                    Text(Tab.mostViewed.title())
                    Image(systemName: Tab.mostViewed.icon())
                }
            
            ArticlesListView(tab: .mostEmailed)
                .tabItem {
                    Text(Tab.mostEmailed.title())
                    Image(systemName: Tab.mostEmailed.icon())
                }
            
            FavoriteListView(tab: .favorite)
                .tabItem {
                    Text(Tab.favorite.title())
                    Image(systemName: Tab.favorite.icon())
                }
            
        }
        .accentColor(.black)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
