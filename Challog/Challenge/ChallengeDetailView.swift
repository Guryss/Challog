//
//  ChallengeDetailView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/13/24.
//

import SwiftUI
import SwiftData

struct ChallengeDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var notes: [Note]
    @State private var selectedIndex: Int = 0
    var challenge: Challenge
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(challenge.title)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    //MARK: create
                    let newNote = Note(content: "")
                    modelContext.insert(newNote)
                }, label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 19, height: 19)
                        .foregroundStyle(.accent)
                        .padding(.trailing, 6)
                })
                .buttonStyle(.plain)
                
                Button(action: {
                    //TODO: delete
                }, label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 19, height: 19)
                        .foregroundStyle(.accent)
                        .padding(.trailing, 6)
                })
                .buttonStyle(.plain)
                
                Button(action: {
                    //TODO: - add local image
                }, label: {
                    HStack {
                        Image(systemName: "photo.on.rectangle")
                            .resizable()
                            .frame(width: 19, height: 19)
                            .foregroundStyle(.accent)
                        
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.accent)
                    }
                })
                .buttonStyle(.plain)
            }
            .padding(15)
            
            HStack {
                List {
                    ForEach(notes.indices, id: \.self) { index in
                        ChallengeDayRow(number: index)
                            .onTapGesture {
                                selectedIndex = index
                                print(selectedIndex)
                            }
                    }
                }
                
                Rectangle()
                    .fill(.background)
                    .frame(width: 720)
                    .overlay {
                        if notes.indices.contains(selectedIndex) {
                            ChallengeWritingView(note: notes[selectedIndex])
                        }
                    }
            }
        }
    }
}

//#Preview {
//    ChallengeDetailView(challenge: challenges[0])
//}
