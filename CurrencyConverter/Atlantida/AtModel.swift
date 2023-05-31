//
//  AtModel.swift
//  CurrencyConverter
//
//  Created by NTTDATA on 31/05/23.
//

import Foundation
import SwiftUI

struct Welcome: Codable, Hashable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]
}
