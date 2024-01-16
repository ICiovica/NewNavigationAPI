//
//  FinanceEntryView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 16/01/2024.
//

import SwiftUI

struct FinanceEntryView: View {
    @State private var isPresented = false
    var body: some View {
        NavigationStack {
            List {
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Financial Planning")
                }
            }
            .navigationTitle("Finance")
            .navigationBarTitleDisplayMode(.inline)
        }
        .fullScreenCover(isPresented: $isPresented) {
            FinanceView()
        }
    }
}

#Preview {
    FinanceEntryView()
}
