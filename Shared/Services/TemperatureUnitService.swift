//
//  TemperatureUnitService.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import Foundation

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
        return TemperatureUnit(rawValue: storageProvider.value(for: .temperatureDegreeUnit))
    }
    
}
