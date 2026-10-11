//
//  Category.swift
//  ExpenseTracker
//
//  Created by Sedef Bozkurt on 11.10.2026.
//

import Foundation

enum Category: String, CaseIterable, Codable, Identifiable {
    case food
    case transport
    case bills
    case other
    
    var id: Self {self}
    
    var title: String{
        switch self {
        case .food:
            "Yeme & İçme"
        case .transport:
            "Ulaşım"
        case .bills:
            "Faturalar"
        case .other:
            "Diğer"
        }
    }
}

