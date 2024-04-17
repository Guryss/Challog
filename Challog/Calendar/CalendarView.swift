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
                    
                Button(action: {
                    changeMonth(by: 1)
                }, label: {
                    Image(systemName: "chevron.forward")
                })
            }
            .padding()
            
            HStack {
                VStack {
                    CalendarHeaderView()
                    calendarGridView
                        //.padding(.leading, 10)
                    Spacer()
                }
                
                RoundedRectangle(cornerRadius: 15)
                   
            }
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
                        
                        CalendarCellView(day: day, selected: date == selectedDate)
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
    
    /// 월 변경
      func changeMonth(by value: Int) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
          self.month = newMonth
        }
      }
}

#Preview {
    CalendarView(month: .now)
}
