//
//  WeatherResponseTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather

final class WeatherResponseTests: XCTestCase {
    
    private var response: WeatherResponse!
    
    override func setUp() {
        super.setUp()
        response = try! JSONDecoder().decode(WeatherResponse.self, from: JSONResponse.weather)
    }
    
    func testConvertToForecast() {
        let forecast = response.asForecast
        XCTAssertEqual(forecast.cityName, "Bangkok")
        XCTAssertEqual(forecast.temperature, 26.83)
        XCTAssertEqual(forecast.humidity, 88)
        XCTAssertEqual(forecast.iconURL, URL(string: "https://openweathermap.org/img/wn/04n@2x.png")!)
        XCTAssertEqual(forecast.weatherDescription, "overcast clouds")
        XCTAssertEqual(forecast.date.formatted(), Date().formatted())

    }
}


