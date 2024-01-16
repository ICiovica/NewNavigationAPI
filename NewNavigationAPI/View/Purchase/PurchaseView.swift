//
//  PurchaseView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 16/01/2024.
//

import SwiftUI

enum PurchaseType {
    case invest
    case contribute
}

struct PurchaseView: View {
    @State private var amount: Int = 0
    
    private var amountIsValid: Bool { amount > 0 }
    
    let action: (Int) -> Void
    var body: some View {
        VStack {
            Text("Select amount:")
            HStack {
                Button {
                    if amountIsValid {
                        amount -= 5
                    }
                } label: {
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 24, height: 4)
                }
                Text(amount.description)
                    .font(.largeTitle)
                    .padding()
                Button {
                    amount += 5
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            
            if amountIsValid {
                Button("Purchase") {
                    action(amount)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .animation(.easeInOut(duration: 0.25), value: amount)
    }
}

#Preview {
    PurchaseView() {_ in}
}
