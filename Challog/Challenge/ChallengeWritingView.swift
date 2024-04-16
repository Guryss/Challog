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
    
     //var dayText: Int
    
    var body: some View {
        VStack {
            Text("\(note.createdAt, formatter: dateFormatter)")
                .fontWeight(.medium)
                .font(.system(size: 14))
                .foregroundStyle(.text)
                .padding(.bottom, 10)
            
//            TextField("오늘의 챌린지를 작성해주세요!", text: $note.content, axis: .vertical)
//                .font(.system(size: 16))
//                .fontWeight(.medium)
//                .padding(.horizontal, 20)
            
            HStack {
                Text("Day")
                
                //TextField("", value: $note., formatter: NumberFormatter())
                TextField("", text: Binding<String>(
                    get: { "\(note.number)" },
                    set: {
                        if let value = Int($0) {
                            note.number = value
                        }
                    }
                ))
                
                Spacer()
            }
            
            TextEditor(text: $note.content)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .padding(.horizontal, 20)
                .overlay {
                    if note.content.isEmpty {
                        Text("오늘의 챌린지를 작성해주세요!")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .foregroundStyle(.secondary)
                    }
                }
            
            Spacer()
        }
    }
}

