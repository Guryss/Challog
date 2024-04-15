//
//  CalendarView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/13/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "MMMM, YYYY"
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("\(Date(), formatter: dateFormatter)")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding()
        }
    }
}

#Preview {
    CalendarView()
}
