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
            Section {
                Button("Invest Now") { router.navigate(to: .purchase(.invest)) }
            } header: {
                Text("Total investments: \(vm.customer.investments)")
            }
            
            Section {
                Button("Contributions") {  router.navigate(to: .contributions, refreshPath: true) }
            } header: {
                Text("Accounts")
            }
            
            Section {
                Button("Account Name") { router.navigate(to: .accountDetails) }
            } header: {
                Text("Settings")
            }
        }
        .navigationTitle("Investments")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    InvestmentsView()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
