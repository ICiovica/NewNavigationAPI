//
//  ContributionsView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

struct ContributionsView: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var vm: CustomerViewModel
    
    var body: some View {
        List {
            contributionsSection
            accountsSection
            accountDetailsSection
        }
        .navigationTitle("Contributions")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var contributionsSection: some View {
        Section {
            Button("Contribute Now") { router.navigate(to: [.purchase(.contribute)]) }
        } header: {
            Text("Total contributions: \(vm.customer.contributions)")
        }
    }
    
    private var accountsSection: some View {
        Section {
            Button("Switch to Investments") { router.navigate(to: [.investments], refreshPath: true) }
        } header: {
            Text("Accounts")
        }
    }
    
    private var accountDetailsSection: some View {
        Section {
            Button("Account Details") { router.navigate(to: [.accountDetails(isTapped: false)]) }
        } header: {
            Text("Settings")
        }
    }
}

#Preview {
    ContributionsView()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
