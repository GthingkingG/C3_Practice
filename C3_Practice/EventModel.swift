//
//  EventModel.swift
//  C3_Practice
//
//  Created by Air on 5/31/25.
//

import SwiftUI

struct EventModel: Identifiable, Hashable {
    let id = UUID()
    var calendar: String
    var title: String
    var startDate: Date
    var endDate: Date
    var isAllDay: Bool
    var color: String
}
