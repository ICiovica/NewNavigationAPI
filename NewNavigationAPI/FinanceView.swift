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
            Button("Contributions") { router.navigate(to: .contributions) }
            Button("Investments") { router.navigate(to: .investments) }
            Button("\(vm.customer.name) Account") { router.navigate(to: [.investments, .investDetail(vm.customer.name)]) }
        }
        .navigationTitle("Financial Planning")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Router.Destination.self) { destination in
            switch destination {
            case .contributions:
                ContributionsView()
            case .investments:
                InvestmentsView()
            case .investDetail(let name):
                InvestDetailView(name: name)
            }
        }
    }
}

#Preview {
    FinanceView()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
