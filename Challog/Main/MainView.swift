//
//  MainView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/12/24.
//

import SwiftUI

struct MainView: View {
    @State private var selectedCategory: Category = .challenge

    var body: some View {
        NavigationSplitView {
            Image(.imgProfile)
                .padding(.top, 50)
            
            Text("구리스\n(Guryss)")
                .padding(.top, 20)
                .padding(.bottom, 80)
                .multilineTextAlignment(.center)
            
            List(Category.allCases, selection: $selectedCategory) { category in
                NavigationLink(value: category) {
                    HStack {
                        Image(systemName: category.emoji)
                        Text(category.title)
                    }
                }
                //TODO: NavigationLink에 tag붙이기
            }
            
        } detail: {
            if selectedCategory == .challenge {
                ChallengeView()
            }
            else {
                CalendarView(month: .now)
            }
        }
        .navigationTitle(selectedCategory.logo)
    }
}

#Preview {
    MainView()
}
