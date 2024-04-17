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
            Text("\(note.createdAt, formatter: dateFormatter)")
                .fontWeight(.medium)
                .font(.system(size: 14))
                .foregroundStyle(.text)
                .padding(.bottom, 10)
            
            HStack {
                Text("Day")
                
                TextField("", text: Binding<String>(
                    get: { "\(note.number)" },
                    set: {
                        if let value = Int($0) {
                            //note.number = value
                            selectedIndex = value
                        }
                    }
                ), onCommit: {
                    // 포커스가 해제될 때 selectedIndex를 업데이트합니다.
                    
                })
                
                Spacer()
                
                Button(action: {
                    note.number = selectedIndex
                }, label: {
                    Text("완료")
                })
            }
            
            TextEditor(text: $note.content)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .padding(.horizontal, 20)
                .overlay {
                    if note.content.isEmpty {
                        Text("챌린지 Day\(note.number)를 작성해주세요!")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .foregroundStyle(.secondary)
                    }
                }
            
            Spacer()
        }
    }
}

