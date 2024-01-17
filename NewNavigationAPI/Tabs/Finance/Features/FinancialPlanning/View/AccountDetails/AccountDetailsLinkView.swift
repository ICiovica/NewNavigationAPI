//
//  AccountDetailsLinkView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 15/01/2024.
//

import SwiftUI

struct AccountDetailsLinkView: View {
    @State private var isPresented: Bool = false
    let customer: CustomerModel
    let isTapped: Bool
    
    var body: some View {
        List {
            Button(customer.name) { isPresented.toggle() }
        }
        .navigationTitle("Account Details")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isPresented) {
            AccountDetailsView(customer: customer)
        }
        .onAppear {
            isPresented = isTapped
        }
    }
}

#Preview {
    AccountDetailsLinkView(customer: .init(), isTapped: false)
}
