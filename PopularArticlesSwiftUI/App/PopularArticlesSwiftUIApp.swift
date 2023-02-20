//
//  PopularArticlesSwiftUIApp.swift
//  PopularArticlesSwiftUI
//
//  Created by Hanna on 15.02.2023.
//

import SwiftUI

@main
struct PopularArticlesSwiftUIApp: App {
    let persistanceController = PersistenseController.shared
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, persistanceController.container.viewContext)
        }
    }
}
