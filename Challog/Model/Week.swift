//
//  Week.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/17/24.
//

import Foundation

enum Week: CaseIterable {
    case sun
    case mon
    case tues
    case wed
    case thur
    case fri
    case sat

    
    var title: String {
        switch self {
        case .sun:
            return "SUN"
        case .mon:
            return "MON"
        case .tues:
            return "TUES"
        case .wed:
            return "WED"
        case .thur:
            return "THUR"
        case .fri:
            return "FRI"
        case .sat:
            return "SAT"
        }
    }
}
