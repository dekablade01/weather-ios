//
//  TemperatureUnitServiceTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather

final class TemperatureUnitServiceTests: XCTestCase {
    
    private var service: TemperatureUnitServiceProtocol!
    private var mock: StorageProviderProtocolMock!
    
    override func setUp() {
        super.setUp()
        mock = .init()
        service = TemperatureUnitService(
            storageProvider: mock
        )
    }
    
    func testSwitchUnit() {
        mock.valueReturnValue = TemperatureUnit.fahrenheit.rawValue
        service.switchUnitType()
        
        XCTAssertEqual(mock.setArgument!.key , "temperature_degree_unit")
        XCTAssertEqual(mock.setArgument?.value as! String, "celsius")
    }
    
    func testNextUnitType() {
        mock.valueReturnValue = TemperatureUnit.celsius.rawValue
        XCTAssertEqual(service.nextUnitType(), .fahrenheit)
    }
    
    func testGetCurrentUnit() {
        mock.valueReturnValue = TemperatureUnit.fahrenheit.rawValue
        let current = service.getCurrentUnit()
        XCTAssertEqual(current, .fahrenheit)
    }
}

private final class StorageProviderProtocolMock: StorageProviderProtocol {
    
    var setArgument: (value: Any?, key: String)?
    func set<T>(_ value: T?, for key: StorageKeys<T>) {
        setArgument = (value: value, key: key.key)
    }

    var valueReturnValue: Any!
    func value<T>(for key: StorageKeys<T>) -> T? {
        return valueReturnValue as? T
    }
}
