//
//  ChallengeWritingView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/14/24.
//

import SwiftUI

struct ChallengeWritingView: View {
    @Bindable var note: Note
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 MM월 dd일 aa hh시 mm분"
        formatter.locale = Locale(identifier: "ko-KR")
        return formatter
    }()
    
    @Binding var selectedIndex: Int
    var body: some View {
        VStack {
            HStack {
                Text("Day")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundStyle(.text)
                    .padding(.leading, 20)
                
                TextField("", text: Binding<String>(
                    get: { "\(note.number)" },
                    set: {
                        if let value = Int($0) {
                            note.number = value
                            selectedIndex = value
                        }
                    }
                ))
                .padding(.trailing, 30)
            }
            .padding(.vertical, 30)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.dayRow)
                .padding()
                .overlay {
                    VStack {
                        Text("\(note.createdAt, formatter: dateFormatter)")
                            .padding(.vertical, 30)
                        
                        TextEditor(text: $note.content)
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                        
                            .overlay {
                                if note.content.isEmpty {
                                    Text("챌린지 Day\(note.number)를 작성해주세요!")
                                        .font(.system(size: 16))
                                        .fontWeight(.regular)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .foregroundStyle(.text)
                            .padding(.horizontal, 50)
                            .padding(.bottom, 30)
                    }
                    .padding()
                }
        }
    }
}

