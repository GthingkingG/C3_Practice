//
//  TimeableView.swift
//  C3_Practice
//
//  Created by Air on 6/3/25.
//

import SwiftUI

struct TimeableView: View {
    @State var event: EventModel
    
    @State var taskStartDate: Date
    @State var taskEndDate: Date
    @State var likedStartTime: Date
    @State var likedEndTime: Date
    
    var body: some View {
        VStack(spacing: 20) {
            Text("일정 정보")
                .font(.largeTitle)
            Text(event.title)
                .font(.largeTitle)
            Text("기존 일정: \(formatDateTime(date: event.startDate)) ~ \(formatDateTime(date: event.endDate))")
        }
        .foregroundStyle(Color.green)
        .padding(.vertical, 40)
        
        VStack {
            Text("작업 시작 기한: \(formatDate(date: taskStartDate))")
            Text("작업 마감 기한: \(formatDate(date: taskEndDate))")
            Text("선호 시간대 \(dateToHourMinute(date: likedStartTime))시 ~ \(dateToHourMinute(date: likedEndTime))시")
        }
        
    }
    
    private func formatDateTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd / HH:mm"
        return formatter.string(from: date)
    }
    
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: date)
    }
    
    private func dateToHourMinute(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
