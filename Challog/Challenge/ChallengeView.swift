//
//  ChallengeView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/12/24.
//

import SwiftUI

struct ChallengeView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.accent)
                .frame(height: 180)
                .shadow(color: .accent, radius: 1, x: 1, y: 1)
                .overlay {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hi, Guryss!")
                                .font(.system(size: 40))
                                .fontWeight(.semibold)
                                .foregroundStyle(.text)
                                .padding(.bottom, 10)
                            
                            Text("Ready to your day with Challog?")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.text)
                        }
                        .padding(.horizontal, 30)
                        
                        Spacer()
                        
                        Image(.logo)
                            .resizable()
                            .frame(width: 250, height: 250)
                    }
                }
                .padding(30)
            
            List {
                ForEach(challenges) { challenge in
                    NavigationLink(destination: ChallengeDetailView(challenge: challenge)) {
                        ChallengeListRow(challenge: challenge)
                    }
                }
            }
        }
    }
}

#Preview {
    ChallengeView()
}
