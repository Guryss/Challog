//
//  ChallengeDetailView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/13/24.
//

import SwiftUI

struct ChallengeDetailView: View {
    var challenge: Challenge
    var body: some View {
        VStack(alignment: .leading) {
            Text(challenge.title)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding(10)
            
            HStack {
                List {
                    ForEach(1..<11) { index in
                        ChallengeDayRow(number: index)
                    }
                }
                
                Rectangle()
                    .fill(.background)
                    .frame(width: 720)
            }
        }
    }
}

#Preview {
    ChallengeDetailView(challenge: challenges[0])
}
