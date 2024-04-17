//
//  MainView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/12/24.
//

import SwiftUI

struct MainView: View {
    @State private var selectedCategory: Category = .calendar
    
    var body: some View {
        NavigationSplitView {
            Text("구리스\n(Guryss)")
                .padding(.bottom, 80)
            
            List(Category.allCases, selection: $selectedCategory) { category in
                NavigationLink(value: category) {
                    HStack {
                        Image(systemName: category.emoji)
                        Text(category.title)
                    }
                }
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
