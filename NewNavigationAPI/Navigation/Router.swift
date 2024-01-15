//
//  Router.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

final class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigateBack() {
        path.removeLast()
    }
    
    func navigateToRoot() {
        path.removeLast(path.count)
    }
    
    func configRoute(to destinations: [any Hashable], refreshPath: Bool = false) {
        if refreshPath {
            path = NavigationPath()
        }
        destinations.forEach { path.append($0) }
    }
}


