//
//  TemperatureFormatter.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 20/8/22.
//

import Foundation

final class TemperatureFormatter: Formatter {
    
    var destinationUnit: TemperatureUnit = .celsius
    
    override func string(for obj: Any?) -> String? {
        guard let double = obj as? Double else { return nil }
        return String(format: "%.1f \(destinationUnit.unit)", double)
    }
    
    func string(for double: Double, with unit: TemperatureUnit) -> String? {
        destinationUnit = unit
        return string(for: double)
    }
}
