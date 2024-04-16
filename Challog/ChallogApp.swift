//
//  ChallogApp.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/12/24.
//

import SwiftUI
import SwiftData

@main
struct ChallogApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        //.modelContainer(for: [Challenge.self])
        .modelContainer(container)
    }
    
    init() {
        let schema = Schema([Challenge.self, Note.self])
        let config = ModelConfiguration("My Challenges", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container")
        }
    }
}

