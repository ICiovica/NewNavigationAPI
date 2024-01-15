//
//  InvestFullScreenCover.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 15/01/2024.
//

import SwiftUI

struct InvestFullScreenCover: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var vm: CustomerViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            topVw
            detailsVw
            navigateToRootBtn
            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 12)
    }
    
    private var topVw: some View {
        HStack {
            navigateBackBtn
            Spacer()
            Button("Dismiss") { dismiss() }
                .padding(.trailing, 6)
        }
        .overlay {
            Text(vm.customer.name)
                .fontWeight(.semibold)
        }
    }
    
    private var navigateBackBtn: some View {
        Button {
            router.navigateBack()
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 11, height: 19, alignment: .leading)
                    .fontWeight(.medium)
                Text("Back")
                Spacer()
            }
        }
    }
    
    private var navigateToRootBtn: some View {
        Button("Navigate to root", action: router.navigateToRoot)
            .buttonStyle(.borderedProminent)
    }
    
    private var detailsVw: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Name: \(vm.customer.name)")
            Text("Age: \(vm.customer.age)")
            Text("Investments: \(vm.customer.investments.amount.description)")
            Text("Contributions: \(vm.customer.contributions.amount.description)")
        }
    }
}

#Preview {
    InvestFullScreenCover()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
