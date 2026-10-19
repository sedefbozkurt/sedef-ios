//
//  ExpenseStorage.swift
//  ExpenseTracker
//
//  Created by Sedef Bozkurt on 19.10.2026.
//

import Foundation

enum ExpenseStorage {
    private static let key = "savedExpenses"
    
    static func save(_ expenses: [Expense]) {
        do {
            let data = try JSONEncoder().encode(expenses)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Failed to save expenses: \(error)")
        }
    }
    
    static func load() -> [Expense] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try JSONDecoder().decode([Expense].self, from: data)
        } catch {
            print("Failed to load expenses: \(error)")
            return []
        }
    }
}
