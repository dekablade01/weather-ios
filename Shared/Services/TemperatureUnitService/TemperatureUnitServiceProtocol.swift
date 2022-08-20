//
//  TemperatureUnitServiceProtocol.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 21/8/22.
//

import Foundation

protocol TemperatureUnitServiceProtocol {
    
    func nextUnitType() -> TemperatureUnit

    func switchUnitType()
    
    func getCurrentUnit() -> TemperatureUnit
}
