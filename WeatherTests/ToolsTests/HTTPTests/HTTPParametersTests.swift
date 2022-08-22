//
//  HTTPParametersTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather

final class HTTPParametersTests: XCTestCase {
    
    private var parameters: HTTPParameters!
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testGeneratingQueryItems() {
        parameters = .url([
            "key": "value",
            "abc": "def"
        ])
        
        XCTAssertEqual(parameters.queryItems.count, 2)
        XCTAssertTrue(parameters.queryItems.contains(.init(name: "key", value: "value")))
        XCTAssertTrue(parameters.queryItems.contains(.init(name: "abc", value: "def")))
    }
}
