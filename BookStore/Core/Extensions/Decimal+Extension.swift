//
//  Decimal+Extension.swift
//  BookStore
//
//  Created by Victor Pacheco on 1/5/22.
//

import Foundation

extension Decimal {
    /// formats the price for euro currency  with tho fraction digits
    var priceEuroFormatted: String? {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.currencyCode = "EUR"
        formatter.numberStyle = .currency
        return formatter.string(from: NSDecimalNumber(decimal: self)) ?? nil
    }
}
