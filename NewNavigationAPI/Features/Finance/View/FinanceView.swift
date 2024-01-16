//
//  FinanceView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

struct FinanceView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var router = Router()
    @StateObject private var vm = CustomerViewModel()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            List {
                Section {
                    Button("Contributions") { router.navigate(to: .contributions) }
                    Button("Investments") { router.navigate(to: .investments) }
                } header: {
                    Text("Accounts")
                }
                
                Section {
                    Button("Account Details") { router.navigate(to: [.investments, .accountDetails]) }
                } header: {
                    Text("Settings")
                }
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
                case .accountDetails:
                    AccountDetailsLinkView(name: vm.customer.name) { router.navigateToRoot() }
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
}

#Preview {
    FinanceView()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
