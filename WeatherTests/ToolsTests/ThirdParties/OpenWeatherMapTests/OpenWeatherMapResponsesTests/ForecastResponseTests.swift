//
//  ForecastResponseTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather
import SwiftUI

final class ForecastResponseTests: XCTestCase {
    
    private var response: ForecastResponse!
    override func setUp() {
        super.setUp()
        
        response = try! JSONDecoder().decode(ForecastResponse.self, from: JSONResponse.forecasts)
    }
    
    func testGetForecasts() {
        let forecasts = response.asForecasts
        
        XCTAssertEqual(forecasts.count, 40)
        let forecast = forecasts[0]
        
        XCTAssertEqual(forecast.cityName, "Bangkok")
        XCTAssertEqual(forecast.temperature, 82.72)
        XCTAssertEqual(forecast.humidity, 77)
        XCTAssertEqual(forecast.iconURL, URL(string: "https://openweathermap.org/img/wn/04d@2x.png")!)
        XCTAssertEqual(forecast.weatherDescription, "overcast clouds")
        XCTAssertEqual(forecast.date.formatted(), "8/21/2022 3:00 AM")
    }
    
}
