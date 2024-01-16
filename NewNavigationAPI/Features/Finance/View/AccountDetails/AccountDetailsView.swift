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
    @EnvironmentObject private var vm: CustomerViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    detailsVw
                    Button("Financial Planning", action: router.navigateToRoot)
                } header: {
                    Text("Account Details")
                }
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
            Text("Name: \(vm.customer.name)")
            Text("Age: \(vm.customer.age)")
            Text("Investments: \(vm.customer.investments)")
            Text("Contributions: \(vm.customer.contributions)")
        }
    }
}

#Preview {
    AccountDetailsView()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
