//
//  CalendarView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/13/24.
//

import SwiftUI
import SwiftData

struct CalendarView: View {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "MMMM, YYYY"
        return formatter
    }()
    
    let noteDateForMatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "MM/dd"
        return formatter
    }()
    
    @State private var date: Date = Date()  // 현재 날짜로 초기화
    @State var month: Date
    @State var selectedDate: Date = Date() // 현재 날짜로 초기화
    
    @Query private var challenges: [Challenge]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack{
                    Button(action: {
                        changeMonth(by: -1)
                    }, label: {
                        Image(systemName: "chevron.backward")
                    })
                    
                    Text("\(month, formatter: dateFormatter)")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .frame(width: 170)
                        .foregroundStyle(.text)
                    
                    Button(action: {
                        changeMonth(by: 1)
                    }, label: {
                        Image(systemName: "chevron.forward")
                    })
                }
                .padding()
                
                Spacer().frame(height: 20)
                
                HStack {
                    VStack {
                        CalendarHeaderView()
                            .padding(.leading, 40)
                            .padding(.top, 20)
                        calendarGridView
                            .padding(.leading, 20)
                            .padding(.bottom, 20)
                    }
                    .padding(.trailing, 20)
                    .background(.challogBackground)
                    .cornerRadius(15)
                    
                    
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 300, height: 580)
                        .foregroundStyle(.challogBackground)
                        .overlay(alignment: .top) {
                            VStack {
                                Text("Nano Challenge")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.accent)
                                    .padding(.top, 20)
                                
                                HStack {
                                    Text("Day10")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.accent)
                                }
                                
                                Text("\(selectedDate, formatter: noteDateForMatter)")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.accent.opacity(0.5))
                                    .padding(.top, 10)
                                
                                Divider()
                                    .frame(height: 7)
                                    .padding()
   
                                //TODO: Challenge와 날짜 연결하기
                                
                                Text("아직 챌린지를 작성하지 않았네요.\n작성하러 가볼까요?")
                                    .fontWeight(.medium)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.text)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 30)
                                
                                NavigationLink(destination: EmptyView()) {
                                    Text("챌린지 쓰러 가기")
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.text)
                                        .padding()
                                        .background(.accent)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(color: .black.opacity(0.1), radius: 10)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                }
            }
            .padding()
        }
    }
    
    // MARK: - 날짜 그리드 뷰
    private var calendarGridView: some View {
        let daysInMonth: Int = numberOfDays(in: month)
        let firstWeekday: Int = firstWeekdayOfMonth(in: month) - 1
        
        return VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
                    if index < firstWeekday {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.clear)
                    } else {
                        let date = getDate(for: index - firstWeekday)
                        let day = index - firstWeekday + 1
                        let isToday = date.formattedCalendarDayDate == today.formattedCalendarDayDate
                        
                        CalendarCellView(day: day, selected: date == selectedDate, isToday: isToday)
                            .onTapGesture {
                                selectedDate = date
                            }
                            .onAppear {
                                selectedDate = .now
                            }
                    }
                }
            }
        }
    }
    
    /// 특정 해당 날짜
    private func getDate(for day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }
    
    /// 해당 월의 시작 날짜
    func startOfMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: month)
        return Calendar.current.date(from: components)!
    }
    
    /// 해당 월에 존재하는 일자 수
    func numberOfDays(in date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    /// 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
    func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        
        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    var today: Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: .now)
        return Calendar.current.date(from: components) ?? .now
    }
    
    /// 월 변경
    func changeMonth(by value: Int) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
            self.month = newMonth
        }
    }
}

extension Date {
    static let calendarDayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy dd"
        return formatter
    }()
    
    var formattedCalendarDayDate: String {
        return Date.calendarDayDateFormatter.string(from: self)
    }
}

#Preview {
    CalendarView(month: .now)
}
