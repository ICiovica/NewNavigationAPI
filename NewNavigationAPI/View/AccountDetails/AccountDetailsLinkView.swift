//
//  AccountDetailsLinkView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 15/01/2024.
//

import SwiftUI

struct AccountDetailsLinkView: View {
    @State private var isPresented = false
    let name: String
    let action: () -> Void
    
    var body: some View {
        List {
            Button("\(name) Account Details") { isPresented.toggle() }
        }
        .navigationTitle("User details")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isPresented) {
            AccountDetailsView()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Dismiss", action: action)
                    .fontWeight(.regular)
            }
        }
    }
}

#Preview {
    AccountDetailsLinkView(name: "John") {}
}
