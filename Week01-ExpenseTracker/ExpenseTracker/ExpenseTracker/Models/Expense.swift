//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Sedef Bozkurt on 11.10.2026.
//

import Foundation

struct Expense: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var amount: Decimal
    var category: Category
    var date: Date
    
    init(
        id: UUID = UUID(),
        title: String,
        amount: Decimal,
        category: Category,
        date: Date = .now
    ) {
        self.id = id
        self.title = title
        self.amount = amount
        self.category = category
        self.date = date
    }
}
