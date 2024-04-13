//
//  Category.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/12/24.
//

import Foundation

enum Category: Int, CaseIterable, Identifiable {
    case calendar
    case challenge
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .calendar:
            return "캘린더"
        case .challenge:
            return "챌린지"
        }
    }
    
    var emoji: String {
        switch self {
        case .calendar:
            return "calendar"
        case .challenge:
            return "figure.run.square.stack"
        }
    }
    
    var logo: String {
        switch self {
        case .calendar:
            return "🍎 Challenge Calendar"
        case .challenge:
            return "🍎 Apple Developer Academy Challenge"
        }
    }
}
