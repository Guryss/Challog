////
////  PreviewChallengeContainer.swift
////  Challog
////
////  Created by Seoyeon Choi on 4/15/24.
////
//
//import SwiftUI
//import SwiftData
//
//@MainActor
//let previewChallengeContainer: ModelContainer = {
//    do {
//        let container = try ModelContainer(for: Challenge.self)
//        
//        for challenge in MockData.previewChallenges {
//            container.mainContext.insert(challenge)
//        }
//        
//        return container
//
//    }catch {
//        fatalError("fail to create container")
//    }
//}()
//
//struct MockData {
//    static let previewChallenges: [Challenge] = [
//        Challenge(title: "Mini Challenge 1", startDate: "2024.03.11", endDate: "2024.03.29", notes: [Note(content: "울랄라", createdAt: .now)]),
//        Challenge(title: "Bridge 1", startDate: "2024.04.01", endDate: "2024.04.05", notes: [Note(content: "울랄라1", createdAt: .now)]),
//        Challenge(title: "Nano Challenge 1", startDate: "2024.04.08", endDate: "2024.04.19", notes: [Note(content: "울랄라2", createdAt: .now)]),
//        Challenge(title: "Bridge 2", startDate: "2024.04.22", endDate: "2024.04.26", notes: [Note(content: "울랄라3", createdAt: .now)]),
//        Challenge(title: "Mini Challenge 2", startDate: "2024.04.29", endDate: "2024.05.31", notes: [Note(content: "울랄라4", createdAt: .now)]),
//        Challenge(title: "Bridge 3", startDate: "2024.06.03", endDate: "2024.06.07", notes: [Note(content: "울랄라5", createdAt: .now)]),
//        Challenge(title: "Nano Challenge 2", startDate: "2024.06.10", endDate: "2024.06.21", notes: [Note(content: "울랄라6", createdAt: .now)]),
//        Challenge(title: "Bridge 4", startDate: "2024.06.24", endDate: "2024.06.28", notes: [Note(content: "울랄라7", createdAt: .now)]),
//        Challenge(title: "Mini Challenge 3", startDate: "2024.07.01", endDate: "2024.08.16", notes: [Note(content: "울랄라8", createdAt: .now)]),
//        Challenge(title: "Bridge 5", startDate: "2024.08.19", endDate: "2024.08.23", notes: [Note(content: "울랄라9", createdAt: .now)]),
//        Challenge(title: "Macro Challenge", startDate: "2024.09.02", endDate: "2024.11.22", notes: [Note(content: "울랄라10", createdAt: .now)]),
//    ]
//}
