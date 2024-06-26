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
    var challenge: Challenge
    @State private var selectedIndex: Int = 0
    @State private var isSelected: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(challenge.title)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    //MARK: create
                    var maximumIndex = 0
                    for note in challenge.notes {
                        if maximumIndex < note.number {
                            maximumIndex = note.number
                        }
                    }
                    let newNote = Note(number: maximumIndex + 1)
                    newNote.number = maximumIndex + 1
                    challenge.notes.append(newNote)
                    selectedIndex = newNote.number
                }, label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 19, height: 19)
                        .foregroundStyle(.accent)
                        .padding(.trailing, 6)
                })
                .buttonStyle(.plain)
                
                Button(action: {
                    //MARK: delete
                    // note.number == selectedIndex인 모든 노트들을 삭제한다.
                    challenge.notes.removeAll(where: { $0.number == selectedIndex })
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
                    ForEach(challenge.notes.sorted(by: { $0.number < $1.number })) { note in
                        ChallengeDayRow(number: note.number, isSelected: note.number == selectedIndex)
                            .onTapGesture {
                                selectedIndex = note.number
                            }
                            .listRowSeparator(.hidden)
                    }
                    //MARK: onDelete -> sorted(), sort() 공부하기 !!
                    .onDelete { indexSet in
                        if let firstIndex = indexSet.first {
                            selectedIndex = challenge.notes.sorted(by: { $0.number < $1.number })[firstIndex].number
                            //removeNote(at: indexSet)
                            challenge.notes.removeAll(where:  { $0.number == selectedIndex })
                        }
                    }
                }
                .overlay {
                    if challenge.notes.isEmpty {
                        Text("\(challenge.title)의 첫 글을 작성해주세요!")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.accent)
                            .padding()
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                    }
                }
                
                Rectangle()
                    .fill(.background)
                    .frame(width: 720)
                    .overlay {
                        // challenge.note.number == selectedIndex인 note들중에 첫번째 인덱스를 가리킨다.
                        if let index = challenge.notes.firstIndex(where: { $0.number == selectedIndex }) {
                            ChallengeWritingView(note: challenge.notes[index], selectedIndex: $selectedIndex)
                        }
                    }
            }
        }
    }
}

