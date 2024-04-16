//
//  Challenge.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/13/24.
//

import Foundation
import SwiftData

@Model
final class Challenge {
    @Attribute(.unique) var title: String
    var startDate: String
    var endDate: String
    
    // Challenge객체를 삭제하면 연관되어 있는 객체인 [Note]도 함께 삭제
    @Relationship(deleteRule: .cascade)
    var notes: [Note] = []
    
    init(title: String, startDate: String, endDate: String) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
    }
}

let testChallenges: [Challenge] = [
    Challenge(title: "Mini Challenge 1", startDate: "2024.03.11", endDate: "2024.03.29"),
    Challenge(title: "Bridge 1", startDate: "2024.04.01", endDate: "2024.04.05"),
    Challenge(title: "Nano Challenge 1", startDate: "2024.04.08", endDate: "2024.04.19"),
    Challenge(title: "Bridge 2", startDate: "2024.04.22", endDate: "2024.04.26"),
    Challenge(title: "Mini Challenge 2", startDate: "2024.04.29", endDate: "2024.05.31"),
    Challenge(title: "Bridge 3", startDate: "2024.06.03", endDate: "2024.06.07"),
    Challenge(title: "Nano Challenge 2", startDate: "2024.06.10", endDate: "2024.06.21"),
    Challenge(title: "Bridge 4", startDate: "2024.06.24", endDate: "2024.06.28"),
    Challenge(title: "Mini Challenge 3", startDate: "2024.07.01", endDate: "2024.08.16"),
    Challenge(title: "Bridge 5", startDate: "2024.08.19", endDate: "2024.08.23"),
    Challenge(title: "Macro Challenge", startDate: "2024.09.02", endDate: "2024.11.22")
]
