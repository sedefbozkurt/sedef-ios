//
//  Date+Sample.swift
//  ExpenseTracker
//
//  Created by Sedef Bozkurt on 12.10.2026.
//

import Foundation

extension Date {
    // Sample data only: crashes on invalid input
    static func from(year: Int, month: Int, day: Int) -> Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        guard let date = Calendar.current.date(from: components) else {
            preconditionFailure("Invalid date: \(year)-\(month)-\(day)")
        }
        
        return date
    }
}
