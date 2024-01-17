//
//  Router.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

enum PurchaseType {
    case invest
    case contribute
}

final class Router: ObservableObject {
    @Published var path: [Destination] = []
    
    enum Destination: Hashable {
        case investments
        case contributions
        case accountDetails
        case purchase(PurchaseType)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func navigateToRoot() {
        path = []
    }
    
    func navigate(to destinations: [Destination], refreshPath: Bool = false) {
        if refreshPath { path = [] }
        destinations.forEach { path.append($0) }
    }
}


