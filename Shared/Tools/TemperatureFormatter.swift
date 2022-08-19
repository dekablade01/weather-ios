//
//  TemperatureFormatter.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 20/8/22.
//

import Foundation

class TemperatureFormatter: Formatter {
    
    func string(for double: Double, with unit: TemperatureUnit) -> String {
        return String(format: "%.1f \(unit.unit)", double)
    }
}
