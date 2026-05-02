//
//  TaskDetailView.swift
//  C3_Practice
//
//  Created by Air on 6/2/25.
//

import SwiftUI

struct TaskDetailView: View {
    @State var event: EventModel
    @State var taskStartDate: Date
    @State var taskEndDate: Date
    
    @State var likedStartTime: Date = {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        components.hour = 9
        components.minute = 0
        return Calendar.current.date(from: components)!
    }()
    @State var likedEndTime: Date = {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        components.hour = 23
        components.minute = 0
        return Calendar.current.date(from: components)!
    }()
    
    @State private var isShowing: Bool = false
    
    var body: some View {
        VStack {
            Text(event.title)
                .font(.largeTitle)
                .foregroundStyle(.green)
            
            Spacer()
            
            VStack {
                DatePicker("작업 가능 시작일", selection: $taskStartDate, displayedComponents: [.date])
                DatePicker("작업 마감일", selection: $taskEndDate, displayedComponents: [.date])
                DatePicker("하루 중 선호 시간대",selection: $likedStartTime, displayedComponents: .hourAndMinute)
                DatePicker("", selection: $likedEndTime, displayedComponents: .hourAndMinute)
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                    print("작업 보류하기")
                }, label: {
                    Text("작업 보류하기")
                })
                
                Spacer()
                
                Button(action: {
                    print("가능한 시간 보기")
                    isShowing = true
                }, label: {
                    Text("가능한 시간 보기")
                })
                .navigationDestination(isPresented: $isShowing) {
                    TimeableView(event: event, taskStartDate: taskStartDate, taskEndDate: taskEndDate, likedStartTime: likedStartTime, likedEndTime: likedEndTime)
                }
            }
            .padding(30)
            .border(Color.blue)
            
        }
        .navigationTitle("세부 정보 입력")
    }
}

#Preview {
    TaskDetailView(event: EventModel(calendar: "TestCalendar", title: "TestTask", startDate: Date(), endDate: Date() + 3600, isAllDay: false, color: "Black"), taskStartDate: Date(), taskEndDate: Date() + 3600)
}
 
