//
//  FinanceView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 16/01/2024.
//

import SwiftUI

struct FinanceView: View {
    @State private var isPresented = false
    var body: some View {
        NavigationStack {
            List {
                financialPlanningBtn
            }
            .navigationTitle("Finance")
            .navigationBarTitleDisplayMode(.inline)
        }
        .fullScreenCover(isPresented: $isPresented) {
            FinancialPlanningView()
        }
    }
    
    private var financialPlanningBtn: some View {
        Button {
            isPresented.toggle()
        } label: {
            Text("Financial Planning")
        }
    }
}

#Preview {
    FinanceView()
}
