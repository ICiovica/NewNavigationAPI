//
//  CustomerModel.swift
//  NewNavigationAPI
//
//  Created by IonutCiovica on 15/01/2024.
//

import Foundation

struct CustomerModel: Identifiable, Hashable {
    let id = UUID()
    let name = "Ionut Ciovica"
    let age = 38
    let investments = InvestmentsModel()
    let contributions = ContributionsModel()
}
