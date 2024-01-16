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
            Section {
                Button("Contribute Now") { router.navigate(to: .purchase(.contribute)) }
            } header: {
                Text("Total contributions: \(vm.customer.contributions)")
            }
            
            Section {
                Button("Switch to Investments") { router.navigate(to: .investments, refreshPath: true) }
            } header: {
                Text("Accounts")
            }
            
            Section {
                Button("Account Details") { router.navigate(to: .accountDetails) }
            } header: {
                Text("Settings")
            }
            
        }
        .navigationTitle("Contributions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContributionsView()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
