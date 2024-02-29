//
//  Subscription.swift
//  PayWallTestSUI
//
//  Created by Dmitry Kononov on 29.02.24.
//

import Foundation

enum Subscription {
    case weekly
    case yearly
    
    var title: String {
        switch self {
        case .weekly: "First 3 days free"
        case .yearly: "Special Offer"
        }
    }
    
    var subTitle: String {
        switch self {
        case .weekly: "Weekly - $9.99"
        case .yearly: "Yearly - $49.99"
        }
    }
    
    var costPerWeekTitle: String? {
        switch self {
        case .weekly: nil
        case .yearly: "$4.99 / week"
        }
    }
    
    var costPerWeek: Double {
        switch self {
        case .weekly: 9.99
        case .yearly: 4.99
        }
    }
    
    var price: Double {
        switch self {
        case .weekly: 9.99
        case .yearly: 49.99
        }
    }
}
