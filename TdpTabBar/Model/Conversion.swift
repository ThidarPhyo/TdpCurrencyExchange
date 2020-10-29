//
//  Conversion.swift
//  TdpTabBar
//
//  Created by Thidar Phyo on 10/28/20.
//

import SwiftUI

//Fetching Data

struct Conversion: Decodable {
    
    var rates: [String: Double]
    var date: String
    var base : String
}

