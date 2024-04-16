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
    @Query(sort: \Note.number) private var notes: [Note]
    @State private var selectedIndex: Int = 0
    @State private var isSelected: Bool = false
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
                    var maximumIndex = 0
                    for note in notes {
                        if maximumIndex < note.number {
                            maximumIndex = note.number
                        }
                    }
                    let newNote = Note(number: maximumIndex + 1)
//                    if let lastIndex = notes.indices.last {
//                        newNote.number = lastIndex
//                    }

                    newNote.number = maximumIndex + 1
                    modelContext.insert(newNote)
                    
                    do {
                        try modelContext.save()
                    } catch {
                        print("Error creating note: \(error.localizedDescription)")
                    }
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
                    if notes.indices.contains(selectedIndex) {
                        modelContext.delete(notes[selectedIndex])
                        do {
                            try modelContext.save()
                        } catch {
                            print("Error deleting note: \(error.localizedDescription)")
                        }
                    }
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
                        ChallengeDayRow(number: notes[index].number)
                            .onTapGesture {
                                selectedIndex = index
                                notes[selectedIndex].isSelected.toggle()
                                print(selectedIndex)
                            }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            deleteNote(notes[index])
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
    
    private func deleteNote(_ note: Note) {
        modelContext.delete(note)
    }
}
