//
//  Challenge.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/13/24.
//

import Foundation
import SwiftData


@Model
final class Challenge: Identifiable {
    var id = UUID()
    var title: String
    var startDate: String
    var endDate: String
    var notes: [Note]
    
    init(id: UUID = UUID(), title: String, startDate: String, endDate: String, notes: [Note]) {
        self.id = id
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.notes = notes
    }
}
