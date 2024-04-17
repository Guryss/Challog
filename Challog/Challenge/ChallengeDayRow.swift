//
//  ChallengeDayRow.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/13/24.
//

import SwiftUI

struct ChallengeDayRow: View {
    var number: Int
    var isSelected: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .overlay {
                HStack {
                    Text("Day\(number)")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundStyle(.text)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                        .foregroundStyle(.text)
                }
                .padding()
            }
            .foregroundStyle(isSelected ? .accent : .dayRow)
            .frame(height: 70)
    }
}
