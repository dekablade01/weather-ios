//
//  FiveDaysForecastViewModelTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 22/8/22.
//

import XCTest
@testable import Weather

final class FiveDaysForecastViewModelTests: XCTestCase {
    
    private var viewModel: FiveDaysForecastViewModel!
    private var forecastService: ForecastServiceProtocolMock!
    private var tempService: TemperatureUnitServiceProtocolMock!
    
    @MainActor override func setUp() {
        super.setUp()
        forecastService = .init()
        tempService = .init()
        viewModel = .init(
            cityName: "Bangkok",
            forecastService: forecastService,
            temperatureService: tempService
        )
    }
    
    func testFetchSuccess() async {
        XCTAssertEqual(viewModel.forecast, [])
        
        forecastService.forecastData = JSONResponse.forecasts
        await viewModel.fetch()

        sleep(1)
        XCTAssertEqual(
            viewModel.forecast,
            try! JSONDecoder().decode(
                ForecastResponse.self,
                from: JSONResponse.forecasts
            ).asForecasts
        )
    }
    
    func testFetchFailure() async {
        XCTAssertEqual(viewModel.forecast, [])
        
        forecastService.forecastData = "".utf8Data
        await viewModel.fetch()
        
        sleep(1)
        XCTAssertEqual(
            viewModel.error?.localizedDescription,
            "The data couldn’t be read because it isn’t in the correct format."
        )
    }
    
    func testStringForDate() {
        XCTAssertEqual(viewModel.string(from: Date(timeIntervalSince1970: 0)), "Thursday 1\n07:00")
    }
    
    func testStringTempFromDouble() {
        XCTAssertEqual(viewModel.formattedTemperature(for: 22), "22.0 °C")
    }
}

private final class ForecastServiceProtocolMock: ForecastServiceProtocol {
    
    var weatherData: Data!
    func weatherForecasts(for cities: [String]) async throws -> [Forecast] {
        return [try! JSONDecoder().decode(
            WeatherResponse.self,
            from: weatherData
        ).asForecast]
    }
    
    var forecastData: Data!
    func fiveDaysForecast(for city: String) async throws -> [Forecast] {
        return try JSONDecoder().decode(
            ForecastResponse.self,
            from: forecastData
        ).asForecasts
    }
}

private final class TemperatureUnitServiceProtocolMock: TemperatureUnitServiceProtocol {
    
    func nextUnitType() -> TemperatureUnit {
        return .fahrenheit
    }
    
    func switchUnitType() {
        
    }
    
    func getCurrentUnit() -> TemperatureUnit {
        return .celsius
    }
    
}
