//
//  AccountDetailsView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 15/01/2024.
//

import SwiftUI

struct AccountDetailsView: View {
    @State private var sheetIsPresented = false
    @State private var alertIsPresented = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var router: Router
    let customer: CustomerModel
    
    var body: some View {
        NavigationStack {
            List {
                accountDetailsSection
                Button("Let's see if I can open a sheet ...") { sheetIsPresented.toggle() }
                Button("What about an alert?") { alertIsPresented.toggle() }
            }
            .navigationTitle("Account Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") { dismiss() }
                        .fontWeight(.regular)
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                Text("Yes, I can 😎")
                    .presentationDetents([.height(80)])
            }
            .alert("Of course I can 😎", isPresented: $alertIsPresented) {
                Button("Great!", role: .cancel) { }
            }
        }
    }
    
    private var detailsVw: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Name: \(customer.name)")
            Text("Age: \(customer.age)")
            Text("Investments: \(customer.investments)")
            Text("Contributions: \(customer.contributions)")
        }
    }
    
    private var accountDetailsSection: some View {
        Section {
            detailsVw
            Button("Financial Planning") { router.navigateToRoot() }
        } header: {
            Text("Account Details")
        }
    }
}

#Preview {
    AccountDetailsView(customer: .init())
        .environmentObject(Router())
}
