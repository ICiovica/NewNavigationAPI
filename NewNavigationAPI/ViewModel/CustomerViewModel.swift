//
//  CustomerViewModel.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 15/01/2024.
//

import Foundation

final class CustomerViewModel: ObservableObject {
    @Published private(set) var customer = CustomerModel()
    
    func purchased(of type: PurchaseType, amount: Int) {
        switch type {
        case .invest:
            customer.investments += amount
        case .contribute:
            customer.contributions += amount
        }
    }
}
