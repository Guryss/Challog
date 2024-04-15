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
    var id: Int
    var content: String = ""
    var createdAt: Date = Date()
    
    init(id: Int, content: String, createdAt: Date) {
        self.id = id
        self.content = content
        self.createdAt = createdAt
    }
}
