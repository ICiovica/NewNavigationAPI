//
//  InvestmentsView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

struct InvestmentsView: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var vm: CustomerViewModel
    
    var body: some View {
        List {
            investmentsSection
            accountsSection
            accountDetailsSection
        }
        .navigationTitle("Investments")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var investmentsSection: some View {
        Section {
            Button("Invest Now") { router.navigate(to: [.purchase(.invest)]) }
        } header: {
            Text("Total investments: \(vm.customer.investments)")
        }
    }
    
    private var accountsSection: some View {
        Section {
            Button("Switch to Contributions") {  router.navigate(to: [.contributions], refreshPath: true) }
        } header: {
            Text("Accounts")
        }
    }
    
    private var accountDetailsSection: some View {
        Section {
            Button("Account Details") { router.navigate(to: [.accountDetails]) }
        } header: {
            Text("Settings")
        }
    }
}

#Preview {
    InvestmentsView()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
