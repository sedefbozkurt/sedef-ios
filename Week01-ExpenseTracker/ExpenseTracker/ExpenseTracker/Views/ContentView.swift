//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Sedef Bozkurt on 11.10.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAddSheet = false
    @State private var expenses: [Expense] = [
        Expense(
            title: "Market alışverişi",
            amount: 450.75,
            category: .food,
            date: Date.from(year: 2026, month: 10, day: 11)
        ),
        Expense(
            title: "Otobüs bileti",
            amount: 55,
            category: .transport,
            date: Date.from(year: 2026, month: 10, day: 10)
        ),
        Expense(
            title: "Elektrik faturası",
            amount: 620.50,
            category: .bills,
            date: Date.from(year: 2026, month: 10, day: 9)
        ),
        Expense(
            title: "Makyaj malzemeleri",
            amount: 1989.74,
            category: .other,
            date: Date.from(year: 2026, month: 10, day: 5)
        )
    ]
    
    private var sortedExpenses: [Expense] {
        expenses.sorted { $0.date > $1.date }
    }
    
    private var totalAmount: Decimal {
        expenses.reduce(Decimal.zero) { total, expense in
            total + expense.amount
        }
    }
    
    var body: some View {
        NavigationStack {
            List(sortedExpenses) { expense in
                ExpenseRow(expense: expense)
            }
            .navigationTitle("Harcamalar")
            .safeAreaInset(edge: .top, spacing: 0) {
                HStack {
                    Text("Toplam Harcama")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text(totalAmount, format: .currency(code: "TRY"))
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(Color(.secondarySystemGroupedBackground),
                            in: RoundedRectangle(cornerRadius: 17)
                )
                .padding(.horizontal)
                .padding(.vertical)
                .background(
                    Color(.systemGroupedBackground),
                    ignoresSafeAreaEdges: []
                )
                
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isShowingAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddSheet) {
                AddExpenseView { newExpense in
                    expenses.append(newExpense)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
