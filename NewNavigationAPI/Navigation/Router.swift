//
//  Router.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

final class Router: ObservableObject {
    @Published var path: [Destination] = []
    
    enum Destination: Hashable {
        case investments
        case contributions
        case investDetail(String)
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
    
    func navigate(to destination: Destination, refreshPath: Bool = false) {
        if refreshPath { path = [] }
        path.append(destination)
    }
}


