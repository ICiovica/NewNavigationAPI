//
//  TabsView.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 14/01/2024.
//

import SwiftUI

enum Tab {
    case dashboard
    case finance
}

struct TabsView: View {
    @State private var selectedTab: Tab = .dashboard
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "d.square.fill")
                }
                .tag(Tab.dashboard)
            FinanceEntryView()
                .tabItem {
                    Label("Finance", systemImage: "f.square.fill")
                }
                .tag(Tab.finance)
        }
        .fontWeight(.medium)
    }
}

#Preview {
    TabsView()
}
