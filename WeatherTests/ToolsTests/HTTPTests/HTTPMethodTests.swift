//
//  HTTPMethodTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather

final class HTTPMethodTests: XCTestCase {
    
    func testGet() {
        XCTAssertEqual(HTTPMethod.get.rawValue, "GET")
    }
}
