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
    
    // challenge와 일대다 관계 연결
    var challenge: Challenge?
    
    init(content: String, createdAt: Date = .now) {
        self.content = content
        self.createdAt = createdAt
    }
}
