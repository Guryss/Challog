//
//  Category.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/12/24.
//

import Foundation

enum Category: Int, CaseIterable, Identifiable {
    case challenge
    case calendar
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .challenge:
            return "챌린지"
        case .calendar:
            return "캘린더"
        }
    }
    
    var emoji: String {
        switch self {
        case .challenge:
            return "figure.run.square.stack"
        case .calendar:
            return "calendar"
        }
        
    }
    
    var logo: String {
        switch self {
        case .challenge:
            return "🍎 Apple Developer Academy Challenge"
        case .calendar:
            return "🍎 Challenge Calendar"
        }
    }
}

    
