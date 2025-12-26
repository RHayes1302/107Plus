//
//  ContentView.swift
//  BookManager
//
//  Created by Ramone Hayes on 11/22/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @AppStorage(SETTINGS_THEME) private var selectedTheme: Theme = .system
    @AppStorage(SETTINGS_ACCENT_COLOR) private var accentColor: Color = .blue
    
    var colorScheme: ColorScheme? {
        switch(selectedTheme){
            case .system:
                return nil
            case .dark:
                return .dark
            case .light:
                return .light
        }
    }

    var body: some View {
        
       TabView {
           BookListView()
               .tabItem {
                   Label("Books", systemImage: "books.vertical.fill")
               }
//           FavoritesView()
//               .tabItem {
//                   Label("Favorites", systemImage: "heart.fill")
//               }
           Settings()
               .tabItem {
                   Label("Settings", systemImage: "gearshape")
               }
               
        }
       .tint(accentColor)
       .tabViewStyle(.tabBarOnly)
       .preferredColorScheme(colorScheme)
    }
}

#Preview {
    ContentView()
}
