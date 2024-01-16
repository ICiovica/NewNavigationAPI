//
//  FinanceView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

struct FinanceView: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var vm: CustomerViewModel
    
    var body: some View {
        List {
            Section {
                Button("Contributions") { router.navigate(to: .contributions) }
                Button("Investments") { router.navigate(to: .investments) }
            } header: {
                Text("Accounts")
            }
            
            Section {
                Button(vm.customer.name) { router.navigate(to: [.investments, .accountDetails(vm.customer.name)]) }
            } header: {
                Text("Details")
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
            case .accountDetails(let name):
                InvestDetailView(name: name) {
                    router.navigateToRoot()
                }
            case .purchase(let type):
                PurchaseView() { amount in
                    vm.purchased(of: type, amount: amount)
                    router.navigateBack()
                }
            }
        }
    }
}

#Preview {
    FinanceView()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
