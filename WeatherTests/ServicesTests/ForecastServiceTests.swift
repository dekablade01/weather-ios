//
//  ForecastServiceTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather

final class ForecastServiceTests: XCTestCase {
    
    private var service: ForecastService!
    private var manager: RequestManagerMock!
    override func setUp() {
        super.setUp()
        manager = .init()
        service = .init(requestManager: manager)
    }
    
    func testWeatherForecasts() async {
        manager.requestReturnValue = try! JSONDecoder()
            .decode(WeatherResponse.self, from: JSONResponse.weather)
        let forecast = try! await service.weatherForecasts(for: ["Bangkok"])[0]
        
        XCTAssertEqual(forecast.cityName, "Bangkok")
        XCTAssertEqual(forecast.temperature, 26.83)
        XCTAssertEqual(forecast.humidity, 88)
        XCTAssertEqual(forecast.iconURL, URL(string: "https://openweathermap.org/img/wn/04n@2x.png")!)
        XCTAssertEqual(forecast.weatherDescription, "overcast clouds")
        XCTAssertEqual(forecast.date.formatted(), Date().formatted())
    }
    
    func testFiveDaysForecasts() async {
        manager.requestReturnValue = try! JSONDecoder()
            .decode(ForecastResponse.self, from: JSONResponse.forecasts)
        
        let forecasts = try! await service.fiveDaysForecast(for: "Bangkok")
        let forecast = forecasts[0]
        
        XCTAssertEqual(forecast.cityName, "Bangkok")
        XCTAssertEqual(forecast.temperature, 82.72)
        XCTAssertEqual(forecast.humidity, 77)
        XCTAssertEqual(forecast.iconURL, URL(string: "https://openweathermap.org/img/wn/04d@2x.png")!)
        XCTAssertEqual(forecast.weatherDescription, "overcast clouds")
        XCTAssertEqual(forecast.date.formatted(), "8/21/2022 3:00 AM")
    }
    
}

private final class RequestManagerMock: RequestManagerProtocol {
    
    var requestReturnValue: Any!
    func request<T>(request: Request<T>) async throws -> T where T : Decodable {
        return requestReturnValue as! T
    }
}
