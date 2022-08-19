//
//  TemperatureUnitService.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
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
        case .celsius:      return 0
        case .fahrenheit:   return 1
        }
    }
    
    var unit: String {
        switch self {
        case .celsius:      return "°C"
        case .fahrenheit:   return "°F"
        }
    }
   
}


protocol TemperatureUnitServiceProtocol {
    
    func nextUnitType() -> TemperatureUnit

    func switchUnitType()
    
    func getCurrentUnit() -> TemperatureUnit
}

final class TemperatureUnitService: TemperatureUnitServiceProtocol {
    
    private let storageProvider: StorageProviderProtocol
    init(storageProvider: StorageProviderProtocol) {
        self.storageProvider = storageProvider
    }
    
    func switchUnitType() {
        storageProvider.set(nextUnitType().rawValue, for: .temperatureDegreeUnit)
    }
    
    func nextUnitType() -> TemperatureUnit {
        return TemperatureUnit(index: ((getCurrentUnit().index + 1) % TemperatureUnit.allCases.count))
    }
    
    func getCurrentUnit() -> TemperatureUnit {
        return TemperatureUnit(rawValue: storageProvider.getValue(for: .temperatureDegreeUnit))
    }
    
}
