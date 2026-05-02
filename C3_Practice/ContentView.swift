//
//  ContentView.swift
//  C3_Practice
//
//  Created by Air on 6/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                Tab("Home", systemImage: "house") {
                    EventView()
                }
                Tab("Archive", systemImage: "archivebox") {
                    HistoryView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
