//
//  CalendarHeaderView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/17/24.
//

import SwiftUI

struct CalendarHeaderView: View {
    var body: some View {
        HStack {
            ForEach(Week.allCases, id: \.self) { week in
                Text(week.title)
                    .font(.system(size: 13))
                    .fontWeight(.medium)
                    .foregroundStyle(.text)
                    .padding(.trailing, 60)
            }
        }
        .frame(width: 600)
    }
}

#Preview {
    CalendarHeaderView()
}
