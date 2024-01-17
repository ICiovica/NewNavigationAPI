//
//  FinancialPlanningView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

struct FinancialPlanningView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var router = Router()
    @StateObject private var vm = CustomerViewModel()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            List {
                accountsSection
                accountDetailsSection
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") { dismiss() }
                        .fontWeight(.regular)
                }
            }
            .navigationTitle("Financial Planning")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Router.Destination.self) { destination in
                switch destination {
                case .contributions:
                    ContributionsView()
                case .investments:
                    InvestmentsView()
                case .accountDetails(let isTapped):
                    AccountDetailsLinkView(name: vm.customer.name, isTapped: isTapped)
                case .purchase(let type):
                    PurchaseView() { amount in
                        vm.purchase(of: type, with: amount)
                        router.navigateBack()
                    }
                }
            }
            .onChange(of: router.path) { path in
                dump(path)
            }
        }
        .environmentObject(router)
        .environmentObject(vm)
    }
    
    private var accountsSection: some View {
        Section {
            Button("Contributions") { router.navigate(to: [.contributions]) }
            Button("Investments") { router.navigate(to: [.investments]) }
        } header: {
            Text("Accounts")
        }
    }
    
    private var accountDetailsSection: some View {
        Section {
            Button("Account Details") { router.navigate(to: [.investments, .accountDetails(isTapped: true)]) }
        } header: {
            Text("Settings")
        }
    }
}

#Preview {
    FinancialPlanningView()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
