//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Sedef Bozkurt on 11.10.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAddSheet = false
    @State private var selectedCategory: Category? = nil
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
    
    private var filteredExpenses: [Expense] {
        guard let selectedCategory else {
            return sortedExpenses
        }
        
        return sortedExpenses.filter {
            $0.category == selectedCategory
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredExpenses) { expense in
                ExpenseRow(expense: expense)
            }
            .navigationTitle("Harcamalar")
            .safeAreaInset(edge: .top, spacing: 0) {
                TotalSummaryView(total: totalAmount)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isShowingAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Picker("Kategori", selection: $selectedCategory) {
                            Text("Tümü")
                                .tag(nil as Category?)
                            
                            ForEach(Category.allCases) { option in
                                Text(option.title)
                                    .tag(option as Category?)
                            }
                        }
                    } label: {
                        Label(
                            selectedCategory?.title ?? "Tümü",
                            systemImage: "line.3.horizontal.decrease.circle"
                        )
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
