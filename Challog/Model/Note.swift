//
//  Note.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/15/24.
//

import Foundation
import SwiftData

@Model
class Note {
    @Attribute(.unique) var id: UUID = UUID()
    var content: String = ""
    var createdAt: Date = Date()
    
    @Relationship(inverse: \Challenge.notes)
    var challenge: Challenge?
    
    init(content: String, createdAt: Date) {
        self.content = content
        self.createdAt = createdAt
    }
}
