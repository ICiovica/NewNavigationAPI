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
    
    var body: some View {
        List {
            Button(name) { isPresented.toggle() }
        }
        .navigationTitle("Account Details")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isPresented) {
            AccountDetailsView()
        }
    }
}

#Preview {
    AccountDetailsLinkView(name: "John")
}
