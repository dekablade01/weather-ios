//
//  TemperatureUnit.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 20/8/22.
//

import Foundation

enum TemperatureUnit: String, CaseIterable {
    
    case celsius
    case fahrenheit
    
    init(rawValue: String?) {
        switch rawValue {
        case TemperatureUnit.celsius.rawValue:
            self = .celsius
        case TemperatureUnit.fahrenheit.rawValue:
            self = .fahrenheit
        default:
            self = .celsius
        }
    }
    
    init(index: Int?) {
        switch index {
        case TemperatureUnit.celsius.index:
            self = .celsius
        case TemperatureUnit.fahrenheit.index:
            self = .fahrenheit
        default:
            self = .celsius
        }
    }
    
    var index: Int {
        switch self {
        case .celsius:
            return 0
        case .fahrenheit:
            return 1
        }
    }
    
    var unit: String {
        switch self {
        case .celsius:      return "°C"
        case .fahrenheit:   return "°F"
        }
    }
   
}
