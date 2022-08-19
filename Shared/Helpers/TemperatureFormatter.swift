//
//  TemperatureFormatter.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 20/8/22.
//

import Foundation

class TemperatureFormatter: Formatter {
    
    var destinationUnit: TemperatureUnit = .celsius
    
    override func string(for obj: Any?) -> String? {
        guard let double = obj as? Double else { return nil }
        return string(for: double, with: destinationUnit)
    }
    
    func string(for double: Double, with unit: TemperatureUnit) -> String {
        return String(format: "%.1f \(unit.unit)", double)
    }
}
