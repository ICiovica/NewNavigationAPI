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
                Button("Investments") { router.navigate(to: .investments, refreshPath: true) }
            } header: {
                Text("Total contributions: \(vm.customer.contributions.amount.description)")
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
