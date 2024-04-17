//
//  CalendarCellView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/17/24.
//

import SwiftUI

struct CalendarCellView: View {
    var day: Int
    var selected: Bool = false
    
    init(day: Int, selected: Bool) {
        self.day = day
        self.selected = selected
    }
    
    var body: some View {
        //        Button(action: {
        //            print("버튼 영역 보기")
        //        }, label: {
        //            VStack {
        //                Divider()
        //                HStack {
        //                    Divider()
        //                    RoundedRectangle(cornerRadius: 5)
        //                        //.opacity(0)
        //                        .background(.selected)
        //
        //                        .overlay(alignment: .topLeading) {
        //                                Circle()
        //                                    .frame(width: 25, height: 25)
        //                                    .foregroundStyle(selected ? .accent.opacity(0.4) : .clear)
        //                                    .overlay {
        //                                        Text(String(day))
        //                                            .padding(2)
        //                                    }
        //                        }
        //                        .foregroundColor(.text)
        //                        .frame(width: 80, height: 80)
        //                    Divider()
        //                }
        //                Divider()
        //            }
        //        })
        //        .buttonStyle(.plain)
        
        VStack {
            Divider()
            
            HStack {
                Divider()
        
                RoundedRectangle(cornerRadius: 5)
                    .opacity(0)
                    .background(.challogBackground)
                    .overlay(alignment: .topLeading) {
                        Circle()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(selected ? .accent.opacity(0.4) : .clear)
                            .overlay {
                                Text(String(day))
                                    .padding(2)
                                    .foregroundStyle(.text)
                            }
                    }
                Divider()
            }
            .frame(width: 80, height: 80)
            
            Divider()
            
        }
    }
    
}




