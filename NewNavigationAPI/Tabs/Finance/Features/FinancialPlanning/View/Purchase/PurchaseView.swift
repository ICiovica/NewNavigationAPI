//
//  PurchaseView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 16/01/2024.
//

import SwiftUI

struct PurchaseView: View {
    @State private var amount: Int = 0
    private var amountIsValid: Bool { amount > 0 }
    
    let action: (Int) -> Void
    var body: some View {
        VStack {
            Text("Select amount:")
            HStack {
                decreaseAmountBtn
                amountVw
                increaseAmountBtn
            }
            purchaseBtn
        }
        .animation(.easeInOut(duration: 0.25), value: amount)
    }
    
    private var decreaseAmountBtn: some View {
        Button {
            if amountIsValid {
                amount -= 5
            }
        } label: {
            Image(systemName: "minus")
                .resizable()
                .frame(width: 24, height: 4)
        }
    }
    
    private var amountVw: some View {
        Text(amount.description)
            .font(.largeTitle)
            .padding()
    }
    
    private var increaseAmountBtn: some View {
        Button {
            amount += 5
        } label: {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 24, height: 24)
        }
    }
    
    @ViewBuilder
    private var purchaseBtn: some View {
        if amountIsValid {
            Button("Purchase") {
                action(amount)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    PurchaseView() {_ in}
}
