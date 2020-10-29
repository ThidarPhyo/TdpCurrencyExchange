//
//  Currency.swift
//  TdpTabBar
//
//  Created by Thidar Phyo on 10/28/20.
//

import SwiftUI

struct Currency: Identifiable {
    
    var id = UUID().uuidString
    var currencyName: String
    var currencyValue: Double
    
}

