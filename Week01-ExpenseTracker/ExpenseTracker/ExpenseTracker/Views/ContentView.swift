//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Sedef Bozkurt on 11.10.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses: [Expense] = [
        Expense(
            title: "Market alışverişi",
            amount: 450.75,
            category: .food,
            date: .now
        ),
        Expense(
            title: "Otobüs bileti",
            amount: 55,
            category: .transport,
            date: .now.addingTimeInterval(-86_400)
        ),
        Expense(
            title: "Elektrik faturası",
            amount: 620.50,
            category: .bills,
            date: .now.addingTimeInterval(-172_800)
        ),
        Expense(
            title: "Makyaj malzemeleri",
            amount: 1989.74,
            category: .other,
            date: .now.addingTimeInterval(-365_200)
        )
    ]
    
    var body: some View {
        NavigationStack {
            List(expenses) { expense in
                ExpenseRow(expense: expense)
            }
            .navigationTitle("Harcamalar")
        }
    }
}

#Preview {
    ContentView()
}
