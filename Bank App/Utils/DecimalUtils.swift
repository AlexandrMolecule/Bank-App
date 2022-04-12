//
//  DecimalUtils.swift
//  Bank App
//
//  Created by Alexandr Gerasimov on 12.04.2022.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
