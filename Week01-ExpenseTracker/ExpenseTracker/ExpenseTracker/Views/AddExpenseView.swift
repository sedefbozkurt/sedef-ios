//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by Sedef Bozkurt on 12.10.2026.
//

import SwiftUI

struct AddExpenseView: View {
    @State private var title: String = ""
    @State private var amount: Decimal? = nil
    @State private var category: Category = .food
    @State private var date: Date = .now
    
    @Environment(\.dismiss) private var dismiss
    
    let onSave: (Expense) -> Void
    
    private var isValid: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && (amount ?? 0) > 0
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Harcama başlığı", text: $title)
                
                TextField("Tutar", value: $amount, format: .number)
                    .keyboardType(.decimalPad)
                
                Picker("Kategori", selection: $category) {
                    ForEach(Category.allCases) { option in
                        Text(option.title)
                            .tag(option)
                    }
                }
                
                DatePicker(
                    "Tarih",
                    selection: $date,
                    displayedComponents: .date
                )
            }
            .navigationTitle("Yeni Harcama")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("İptal") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") {
                        guard let amount, amount > 0 else {
                            return
                        }
                        
                        let trimmedTitle = title.trimmingCharacters(
                            in: .whitespacesAndNewlines
                        )
                        
                        let expense = Expense(
                            title: trimmedTitle,
                            amount: amount,
                            category: category,
                            date: date
                        )
                        
                        onSave(expense)
                        dismiss()
                    }
                    .disabled(!isValid)
                }
            }
        }
    }
}

#Preview {
    AddExpenseView { _ in }
}
