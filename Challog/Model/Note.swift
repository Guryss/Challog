//
//  Note.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/15/24.
//

import Foundation
import SwiftData

@Model
class Note: Identifiable {
    //class: 생성시 class만의 고유한 주소값이 생기기 때문에 Identifiable 프로토콜 채택 시 id 생성 안해도 된다!
    //var id: UUID = UUID()
    var content: String = ""
    var createdAt: Date = Date()
    var number: Int
    // challenge와 일대다 관계 연결
    var challenge: Challenge?
    
    // Note들 목록 중에서 선택된 노트를 표시하기 위해 사용
    @Transient var isSelected: Bool = false
    
    init(number: Int) {
        self.number = number
    }
}
