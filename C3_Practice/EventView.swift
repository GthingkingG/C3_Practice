//
//  EventView.swift
//  C3_Practice
//
//  Created by Air on 5/31/25.
//

import SwiftUI
import EventKit

struct EventView: View {
    
    @State private var calendar: Calendar = .current
    @State private var selectedStartDate: Date = .init()
    @State private var selectedEndDate: Date = .init()
    
    @Bindable private var eventViewModel: EventViewModel = .init()
    var body: some View {
            List(eventViewModel.events) { event in
                Button(action: {
                    eventViewModel.selectedEvent = event
                }, label: {
                    VStack {
                        Text(event.calendar)
                        Text(event.title)
                        Text("\(formattedDate(event.startDate)) ~ \(formattedDate(event.endDate))")
                        Text("\(event.isAllDay)")
                    }
                })
                
            }
            .task {
                self.calendar = .current
                self.selectedStartDate = calendar.startOfDay(for: .now)
                self.selectedEndDate = calendar.startOfDay(for: .now)
            } //시작 날짜, 끝 날짜 디폴트 값 설정
            .navigationDestination(item: $eventViewModel.selectedEvent, destination: {_ in
                if let data = eventViewModel.selectedEvent {
                    TaskDetailView(event: data, taskStartDate: data.startDate, taskEndDate: data.endDate)
                }
            })
            
            VStack(spacing: 10) {
                DatePicker("시작 날짜", selection: $selectedStartDate, displayedComponents: [.date])
                
                DatePicker("끝 날짜", selection: $selectedEndDate, displayedComponents: [.date])
                
                Button(action: {
                    eventViewModel.fetchEvents(selectedStartDate: selectedStartDate, selectedEndDate: selectedEndDate + 86400)
                    //시작날짜와 끝날짜 기준으로 일정들 불러오기
                }, label: {
                    Text("일정 불러오기 버튼")
                        .foregroundStyle(Color.red)
                })
            }
            .padding(30)
            .border(Color.green)
            
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        return formatter.string(from: date)
    } //Date타입 형식 바꾸기
}
#Preview {
    EventView()
}
