//
//  TemperatureFormatterTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 22/8/22.
//

import XCTest
@testable import Weather

final class TemperatureFormatterTests: XCTestCase {
    
    private var formatter: TemperatureFormatter!
    override func setUp() {
        super.setUp()
        
        formatter = .init()
    }
    
    func testFormat() {
        XCTAssertEqual(formatter.string(for: 20.0), "20.0 °C")
        XCTAssertEqual(formatter.string(for: 25, with: .fahrenheit), "25.0 °F")
    }
}
