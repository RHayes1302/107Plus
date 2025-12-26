//
//  BookManagerApp.swift
//  BookManager
//
//  Created by Ramone Hayes on 11/22/25.
//

import SwiftUI
import SwiftData

@main
struct BookManagerApp: App {

    let modelContainer: ModelContainer
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }
    
    init () {
        do {
            modelContainer = try ModelContainer(for: PersistentBook.self)
        } catch {
            fatalError("Unable to create model container")
        }
    }
}
