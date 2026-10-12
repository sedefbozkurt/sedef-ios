//
//  ExpenseRow.swift
//  ExpenseTracker
//
//  Created by Sedef Bozkurt on 11.10.2026.
//

import SwiftUI

struct ExpenseRow: View {
    let expense: Expense
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 5) {
                Text(expense.title)
                    .font(.headline)
                
                Text(expense.category.title)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(
                    expense.date.formatted(
                        .dateTime
                            .day()
                            .month(.abbreviated)
                            .year()
                    )
                )
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Text(
                expense.amount,
                format: .currency(code: "TRY")
            )
            .font(.subheadline.weight(.semibold))
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    ExpenseRow(
        expense: Expense(
            title: "Market alışverişi",
            amount: 450.75,
            category: .food,
            date: Date.from(year: 2026, month: 10, day: 11)
        )
    )
}
