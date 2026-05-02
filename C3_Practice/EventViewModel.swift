//
//  EventViewModel.swift
//  C3_Practice
//
//  Created by Air on 6/3/25.
//

import SwiftUI
import EventKit
import Observation

@Observable
class EventViewModel {
    
    var events: [EventModel] = []
    
    var selectedEvent: EventModel? = nil
    
    
    
    
    // MARK: - Apple Calendar
    
    func fetchEvents(selectedStartDate: Date, selectedEndDate: Date) {
        let eventStore = EKEventStore()
        eventStore.requestFullAccessToEvents() { (granted, error) in
            if granted && error == nil {
                guard let interval = Calendar.current.dateInterval(of: .month, for: Date()) else { print("Error1")
                    return
                }
                
                let predicate = eventStore.predicateForEvents(withStart: interval.start, end: interval.end, calendars: nil)
                
                let testEvents = eventStore.events(matching: predicate)
                self.events.removeAll()
                for event in testEvents {
                    if event.startDate > selectedStartDate && event.endDate < selectedEndDate {
                        self.events.append(.init(calendar: event.calendar.title, title: event.title ?? "제목오류", startDate: event.startDate ?? Date(), endDate: event.endDate ?? Date() + 3600, isAllDay: event.isAllDay, color: String(describing: event.calendar.cgColor)))
                    }
                }
                
                
            }
        }
    }
}
