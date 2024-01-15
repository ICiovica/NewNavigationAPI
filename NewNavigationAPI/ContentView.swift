//
//  ContentView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router = Router()
    @StateObject private var vm = CustomerViewModel()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            FinanceView()
        }
        .environmentObject(router)
        .environmentObject(vm)
    }
}

#Preview {
    ContentView()
        .environmentObject(Router())
        .environmentObject(CustomerViewModel())
}
