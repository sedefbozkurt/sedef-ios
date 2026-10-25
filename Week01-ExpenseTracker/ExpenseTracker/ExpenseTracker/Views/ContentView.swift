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
    @State private var expenses: [Expense] = ExpenseStorage.load()
    @State private var showsHiddenBanner = false
    
    private var sortedExpenses: [Expense] {
        expenses.sorted { $0.date > $1.date }
    }
    
    private var filteredExpenses: [Expense] {
        guard let selectedCategory else {
            return sortedExpenses
        }
        
        return sortedExpenses.filter {
            $0.category == selectedCategory
        }
    }
    
    private var totalAmount: Decimal {
        filteredExpenses.reduce(Decimal.zero) { total, expense in
            total + expense.amount
        }
    }
    
    private var summaryTitle: String {
        guard let selectedCategory else {
            return "Toplam Harcama"
        }
        
        return "\(selectedCategory.title) Toplamı"
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredExpenses) { expense in
                    ExpenseRow(expense: expense)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                expenses.removeAll {
                                    $0.id == expense.id
                                }
                            } label: {
                                Label("Sil", systemImage: "trash")
                            }
                        }
                }
            }
            .navigationTitle("Harcamalar")
            .safeAreaInset(edge: .top, spacing: 0) {
                VStack(spacing: 7) {
                    TotalSummaryView(
                        title: summaryTitle,
                        total: totalAmount
                    )
                    
                    if showsHiddenBanner {
                        HStack(spacing: 13) {
                            Image(systemName: "info.circle")
                                .foregroundStyle(.secondary)
                            
                            Text(
                                "Harcama kaydedildi, seçili filtre sebebiyle listede görünmüyor."
                            )
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button("Tümünü Göster") {
                                selectedCategory = nil
                            }
                            .font(.subheadline.weight(.medium))
                        }
                        .padding()
                        .background(
                            .secondary.opacity(0.2),
                            in: RoundedRectangle(cornerRadius: 13)
                        )
                        .padding(.horizontal)
                        .padding(.bottom, 17)
                    }
                }
                
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
                    
                    if let selectedCategory,
                       selectedCategory != newExpense.category {
                        showsHiddenBanner = true
                    }
                }
            }
            .onChange(of: expenses) {
                ExpenseStorage.save(expenses)
            }
            .onChange(of: selectedCategory) {
                showsHiddenBanner = false
            }
        }
    }
}

#Preview {
    ContentView()
}
