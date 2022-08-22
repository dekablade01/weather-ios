//
//  ForecastTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather

final class ForecastTests: XCTestCase {
    
    private var forecast: Forecast!

    override func setUp() {
        super.setUp()
        let weatherResponse = try! JSONDecoder().decode(
            WeatherResponse.self,
            from: JSONResponse.weather
        )
        forecast = .init(
            name: weatherResponse.name,
            weather: weatherResponse.weather,
            main: weatherResponse.main,
            date: Date(timeIntervalSince1970: 0)
        )
    }
    
    func testInit() {
        XCTAssertEqual(forecast.cityName, "Bangkok")
        XCTAssertEqual(forecast.temperature, 26.83)
        XCTAssertEqual(forecast.humidity, 88)
        XCTAssertEqual(forecast.iconURL, URL(string: "https://openweathermap.org/img/wn/04n@2x.png")!)
        XCTAssertEqual(forecast.weatherDescription, "overcast clouds")
        XCTAssertEqual(forecast.date.formatted(), "1/1/1970 7:00 AM")
        
        XCTAssertEqual(
            forecast.id,
            "Bangkok-26.83-88-Optional(https://openweathermap.org/img/wn/04n@2x.png)-overcast clouds-1970-01-01 00:00:00 +0000"
        )
    }
}
