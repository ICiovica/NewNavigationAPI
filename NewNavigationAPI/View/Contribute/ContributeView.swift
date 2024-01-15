//
//  ContributionsView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

struct ContributionsView: View {
    let amount: Int
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Total contributions: \(amount.description)")
            Button("Invest Now", action: action)
                .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Pension Contribution")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContributionsView(amount: 0) {}
}
