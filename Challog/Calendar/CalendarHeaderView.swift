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
                    .font(.system(size: 10))
                    .fontWeight(.medium)
                    .foregroundStyle(.text)
                    .frame(maxWidth: .infinity)
                
               Spacer().frame(width: 65)
            }
        }
    }
}

#Preview {
    CalendarHeaderView()
}
