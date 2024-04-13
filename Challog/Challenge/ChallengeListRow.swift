//
//  ChallengeListRow.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/13/24.
//

import SwiftUI

struct ChallengeListRow: View {
    var challenge: Challenge
    var body: some View {
        HStack {
            Text("🗂️")
                .font(.system(size: 50))
                .padding(.trailing, 30)
            
            VStack(alignment: .leading) {
                Text(challenge.title)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundStyle(.text)
                    .padding(.bottom, 5)
                
                Text("\(challenge.startDate) ~ \(challenge.endDate)")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.text)
            }
        }
        .padding(15)
    }
}
