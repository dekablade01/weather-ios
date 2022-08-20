//
//  TemperatureUnitService.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import Foundation

final class TemperatureUnitService: TemperatureUnitServiceProtocol {
    
    private let storageProvider: StorageProviderProtocol
    
    init(storageProvider: StorageProviderProtocol) {
        self.storageProvider = storageProvider
    }
    
    func switchUnitType() {
        storageProvider.set(nextUnitType().rawValue, for: .temperatureDegreeUnit)
    }
    
    func nextUnitType() -> TemperatureUnit {
        TemperatureUnit(index: ((getCurrentUnit().index + 1) % TemperatureUnit.allCases.count))
    }
    
    func getCurrentUnit() -> TemperatureUnit {
        TemperatureUnit(rawValue: storageProvider.value(for: .temperatureDegreeUnit))
    }
    
}
