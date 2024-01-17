//
//  AccountDetailsLinkView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 15/01/2024.
//

import SwiftUI

struct AccountDetailsLinkView: View {
    @State private var isPresented: Bool = false
    let name: String
    let isTapped: Bool
    
    var body: some View {
        List {
            Button(name) { isPresented.toggle() }
        }
        .navigationTitle("Account Details")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isPresented) {
            AccountDetailsView()
        }
        .onAppear {
            isPresented = isTapped
        }
    }
}

#Preview {
    AccountDetailsLinkView(name: "John", isTapped: false)
}
