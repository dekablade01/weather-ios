//
//  OpenWeatherMapRequestsTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather
final class OpenWeatherMapRequestsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testWeatherRequest() {
        let cityName = "bangkok"
        let request = OpenWeatherMapRequests
            .weather(for: cityName)
        
        XCTAssertEqual(try! request.url.asURL().absoluteString, "https://api.openweathermap.org/data/2.5/weather")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.parameters, .url(["q": cityName]))
    }
    
    func testForecastRequest() {
        let cityName = "bangkok"
        let request = OpenWeatherMapRequests
            .forecast(for: cityName)
        
        XCTAssertEqual(try! request.url.asURL().absoluteString, "https://api.openweathermap.org/data/2.5/forecast")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.parameters, .url(["q": cityName]))
    }
}
