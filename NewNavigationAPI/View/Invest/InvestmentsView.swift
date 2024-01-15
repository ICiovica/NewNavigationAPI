//
//  InvestmentsView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

struct InvestmentsView: View {
    let amount: Int
    let name: String
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Total investments: \(amount.description)")
            NavigationLink("Go to **\(name)** details", value: name)
                .buttonStyle(.borderedProminent)
            Button("Contribute Now", action: action)
                .buttonStyle(.borderedProminent)

        }
        .navigationTitle("Investment Funds")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: String.self) { name in
            InvestDetailView(name: name)
        }
    }
}

#Preview {
    InvestmentsView(amount: 0, name: .init()) {}
        .environmentObject(Router())
}
