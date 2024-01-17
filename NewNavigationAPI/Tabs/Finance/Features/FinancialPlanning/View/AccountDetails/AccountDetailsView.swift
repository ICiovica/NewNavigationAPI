//
//  AccountDetailsView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 15/01/2024.
//

import SwiftUI

struct AccountDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var router: Router
    let customer: CustomerModel
    
    var body: some View {
        NavigationStack {
            List {
                accountDetailsSection
            }
            .navigationTitle("Account Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") { dismiss() }
                        .fontWeight(.regular)
                }
            }
        }
    }
    
    private var detailsVw: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Name: \(customer.name)")
            Text("Age: \(customer.age)")
            Text("Investments: \(customer.investments)")
            Text("Contributions: \(customer.contributions)")
        }
    }
    
    private var accountDetailsSection: some View {
        Section {
            detailsVw
            Button("Financial Planning", action: router.navigateToRoot)
        } header: {
            Text("Account Details")
        }
    }
}

#Preview {
    AccountDetailsView(customer: .init())
        .environmentObject(Router())
}
