//
//  CalendarCellView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/17/24.
//

import SwiftUI

struct CalendarCellView: View {
    var day: Int
    var selected: Bool = false
    
    init(day: Int, selected: Bool) {
        self.day = day
        self.selected = selected
    }
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Divider()
                RoundedRectangle(cornerRadius: 5)
                    .opacity(0)
                    .overlay(alignment: .topLeading) {
                        Text(String(day))
                    }
                    .foregroundColor(.text)
                    .frame(width: 80, height: 80)
                    .background(selected ? .accent.opacity(0.4) : .clear)
                Divider()
            }
            
            Divider()
        }
        
    }
}


