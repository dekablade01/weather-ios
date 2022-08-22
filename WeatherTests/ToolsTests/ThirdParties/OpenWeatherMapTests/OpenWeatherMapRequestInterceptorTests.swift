//
//  OpenWeatherMapRequestInterceptorTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather
final class OpenWeatherMapRequestInterceptorTests: XCTestCase {
    
    private var intercepter: OpenWeatherMapRequestInterceptor!
    private var serviceMock: TemperatureUnitServiceProtocolMock!
    override func setUp() {
        super.setUp()
        serviceMock = .init()
        intercepter = .init(apiKey: "hello", tempUnitService: serviceMock)
    }
    
    func testAdapt() {
        let urlRequest = URLRequest(url: URL(string: "https://issarapong.me")!)
        serviceMock.currentUnitReturnValue = .fahrenheit

        let adapted = intercepter.adapt(urlRequest)
        
        let components = URLComponents(string: adapted.url!.absoluteString)!
        XCTAssertEqual(components.scheme, "https")
        XCTAssertEqual(components.host, "issarapong.me")
        XCTAssertEqual(components.queryItems, [
            .init(name: "appid", value: "hello"),
            .init(name: "units", value: "imperial")
        ])
    }
}

private class TemperatureUnitServiceProtocolMock: TemperatureUnitServiceProtocol {
    
    var currentUnitReturnValue: TemperatureUnit!
    func getCurrentUnit() -> TemperatureUnit {
        return currentUnitReturnValue
    }
    
    var nextUnitTypeReturnValue: TemperatureUnit!
    func nextUnitType() -> TemperatureUnit {
        return nextUnitTypeReturnValue
    }
    
    var switchUnitTypeCalled = false
    func switchUnitType() {
        switchUnitTypeCalled = true
    }
}
