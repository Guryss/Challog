//
//  ChallengeDayRow.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/13/24.
//

import SwiftUI

struct ChallengeDayRow: View {
    var number: Int
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .overlay {
                HStack {
                    Text("Day\(number+1)")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundStyle(.text)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                        .foregroundStyle(.text)
                }
                .padding()
            }
            .foregroundStyle(.background)
            .frame(width: 250, height: 70)
    }
}

#Preview {
    ChallengeDayRow(number: 1)
}
