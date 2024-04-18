//
//  CalendarView.swift
//  Challog
//
//  Created by Seoyeon Choi on 4/13/24.
//

import SwiftUI

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
        formatter.dateFormat = "MM월 dd일"
        return formatter
    }()
    
    @State private var date = Date()
    @State var month: Date
    @State var selectedDate: Date = Date()
    
    var body: some View {
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
            
            Spacer().frame(height: 40)
            
            HStack {
                VStack {
                    CalendarHeaderView()
                        .padding(.leading, 40)
                    calendarGridView
                    
                    Spacer()
                }
                .frame(width: 700, height: 600)
                .padding(.trailing, 20)
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 300, height: 600)
                    .foregroundStyle(.selected)
                    .overlay(alignment: .top) {
                        Text("\(selectedDate, formatter: noteDateForMatter)")
                            .padding()
                    }
            }
        }
        .padding()
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
        let now = Date()
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
