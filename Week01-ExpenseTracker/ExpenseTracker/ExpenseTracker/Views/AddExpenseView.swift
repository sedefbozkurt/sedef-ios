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
        }
    }
}

#Preview {
    AddExpenseView()
}
