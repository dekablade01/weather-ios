//
//  TemperatureUnitTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 22/8/22.
//

import XCTest
@testable import Weather

final class TemperatureUnitTests: XCTestCase {
    
    private var unit: TemperatureUnit!
    
    func testInitWithIndex() {
        unit = .init(index: 0)
        XCTAssertEqual(unit.unit, "°C")
        XCTAssertEqual(unit.index, 0)
        XCTAssertEqual(unit.rawValue, "celsius")
        
        unit = .init(index: 1)
        XCTAssertEqual(unit.unit, "°F")
        XCTAssertEqual(unit.index, 1)
        XCTAssertEqual(unit.rawValue, "fahrenheit")
        
        unit = .init(index: nil)
        XCTAssertEqual(unit.unit, "°C")
        XCTAssertEqual(unit.index, 0)
        XCTAssertEqual(unit.rawValue, "celsius")

    }
    
    func testInitWithRawValue() {
        unit = .init(rawValue: "celsius")
        XCTAssertEqual(unit.unit, "°C")
        XCTAssertEqual(unit.index, 0)
        XCTAssertEqual(unit.rawValue, "celsius")
        
        unit = .init(rawValue: "fahrenheit")
        XCTAssertEqual(unit.unit, "°F")
        XCTAssertEqual(unit.index, 1)
        XCTAssertEqual(unit.rawValue, "fahrenheit")
        
        unit = .init(rawValue: nil)
        XCTAssertEqual(unit.unit, "°C")
        XCTAssertEqual(unit.index, 0)
        XCTAssertEqual(unit.rawValue, "celsius")
    }
}
