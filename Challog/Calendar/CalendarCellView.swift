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
    var isToday: Bool
    
    init(day: Int, selected: Bool, isToday: Bool) {
        self.day = day
        self.selected = selected
        self.isToday = isToday
    }
    
    private var backgroundColor: Color {
        if selected {
            return .accent.opacity(0.6)
        }
        else if isToday {
            return .accent
        }
        else {
            return .clear
        }
    }
    
    var body: some View {
        VStack {
            Divider()
                .foregroundStyle(selected ? .accent : .text)

                RoundedRectangle(cornerRadius: 5)
                    .opacity(0)
                    .background(.challogBackground)
                    .overlay(alignment: .topLeading) {
                        Circle()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(backgroundColor)
                            .overlay {
                                Text(String(day))
                                    .padding(2)
                                    .foregroundStyle(.text)
                            }
            }
            .frame(width: 80, height: 80)
            
            Divider()
                .foregroundStyle(selected ? .accent : .text)
            
        }
        .foregroundStyle(isToday ? .accent : .clear)
    }
    
}




