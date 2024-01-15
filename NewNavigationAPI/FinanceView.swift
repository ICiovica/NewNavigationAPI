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
        VStack(spacing: 16) {
            Group {
                NavigationLink("Contribute Now", value: vm.customer.contributions)
                NavigationLink("Invest Now", value: vm.customer.investments)
            }
            .buttonStyle(.borderedProminent)
            Button("Go To **\(vm.customer.name)** Details") { router.configRoute(to: [vm.customer.investments, vm.customer.name]) }
                .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Financial Planning")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: ContributionsModel.self) { contributions in
            ContributionsView(amount: contributions.amount) {
                router.configRoute(to: [InvestmentsModel()], refreshPath: true)
            }
        }
        .navigationDestination(for: InvestmentsModel.self) { investments in
            InvestmentsView(amount: investments.amount, name: vm.customer.name) {
                router.configRoute(to: [vm.customer.contributions], refreshPath: true)
            }
        }
    }
}

#Preview {
    FinanceView()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
