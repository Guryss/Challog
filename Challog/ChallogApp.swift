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
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [Challenge.self, Note.self])
    }
}

