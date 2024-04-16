//
//  ChallengeDayRow.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/13/24.
//

import SwiftUI

struct ChallengeDayRow: View {
    var number: Int
    @State private var isSelected: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
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
            .frame(width: 250, height: 70)
    }
}
//
//#Preview {
//    ChallengeDayRow(number: 1)
//}
