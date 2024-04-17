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
