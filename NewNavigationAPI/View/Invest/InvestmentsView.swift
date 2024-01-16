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
                Button("Contributions") {  router.navigate(to: .contributions, refreshPath: true) }
            } header: {
                Text("Total investments: \(vm.customer.investments.amount.description)")
            }
            
            Button("\(vm.customer.name) Account") { router.navigate(to: .investDetail(vm.customer.name)) }
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
