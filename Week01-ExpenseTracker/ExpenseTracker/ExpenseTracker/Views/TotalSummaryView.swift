//
//  TotalSummaryView.swift
//  ExpenseTracker
//
//  Created by Sedef Bozkurt on 18.10.2026.
//

import SwiftUI

struct TotalSummaryView: View {
    let title: String
    let total: Decimal
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            
            Spacer()
            
            Text(total, format: .currency(code: "TRY"))
                .font(.headline)
                .fontWeight(.semibold)
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground),
                    in: RoundedRectangle(cornerRadius: 17)
        )
        .padding()
        .background(
            Color(.systemGroupedBackground),
            ignoresSafeAreaEdges: []
        )
    }
}

#Preview {
    TotalSummaryView(title: "Toplam Harcama", total: 1500)
}
