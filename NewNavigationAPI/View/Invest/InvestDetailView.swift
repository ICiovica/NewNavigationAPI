//
//  InvestDetailView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 15/01/2024.
//

import SwiftUI

struct InvestDetailView: View {
    @EnvironmentObject private var router: Router
    let name: String
    @State private var isPresented = false
    
    var body: some View {
        Button("Present **\(name)** details") { isPresented.toggle() }
            .buttonStyle(.borderedProminent)
            .navigationTitle("User details")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $isPresented) {
                InvestFullScreenCover()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss", action: router.navigateToRoot)
                }
            }
    }
}

#Preview {
    InvestDetailView(name: "John")
        .environmentObject(Router())
}
