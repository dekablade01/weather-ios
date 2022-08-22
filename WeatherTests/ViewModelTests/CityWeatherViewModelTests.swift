//
//  CityWeatherViewModelTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 22/8/22.
//

import XCTest
@testable import Weather

final class CityWeatherViewModelTests: XCTestCase {
    
    private var viewModel: CityWeatherViewModelProtocol!
    private var forecastService: ForecastServiceProtocolMock!
    private var savedCitiesService: SavedCitiesServiceProtocolMock!
    private var temperatureService: TemperatureUnitServiceProtocolMock!
    
    override func setUp() {
        super.setUp()
        
        forecastService = .init()
        savedCitiesService = .init()
        temperatureService = .init()
        
        viewModel = CityWeatherViewModel(
            forecastService: forecastService,
            savedCitiesService: savedCitiesService,
            temperatureService: temperatureService
        )
    }
    
    func testAddCity() {
        let city = "Phuket"
        
        viewModel.addCity(city)
        XCTAssertEqual(savedCitiesService.addCityArgument, city)
    }
    
    func testDeleteCity() {
        let city = "Phuket"
        
        viewModel.delete(city)
        XCTAssertEqual(savedCitiesService.removeCityArgument, city)
    }
    
    func testRefresh() {
        savedCitiesService.cities = ["Phuket", "Moscow"]
        forecastService.weatherData = JSONResponse.weather
        viewModel.refresh()
        sleep(1)
        XCTAssertEqual(forecastService.weatherForecastArgument, savedCitiesService.cities)
    }
    
    func testSwitchingTempUnit() {
        viewModel.switchTemperatureUnit()
        XCTAssertTrue(temperatureService.switchUnitTypeCalled)
    }
    
    func testFormatTemp() {
        XCTAssertEqual(viewModel.formattedTemperature(for: 20), "20.0 °C")
    }
}

private final class ForecastServiceProtocolMock: ForecastServiceProtocol {
    
    var weatherData: Data!
    var weatherForecastArgument: [String]!
    func weatherForecasts(for cities: [String]) async throws -> [Forecast] {
        weatherForecastArgument = cities
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
    
    private(set) var switchUnitTypeCalled = false
    func switchUnitType() {
        switchUnitTypeCalled = true
    }
    
    func getCurrentUnit() -> TemperatureUnit {
        return .celsius
    }
    
}

private class SavedCitiesServiceProtocolMock: SavedCitiesServiceProtocol {
    
    var cities: [String] = []
    
    var addCityArgument: String!
    func add(_ city: String) {
        addCityArgument = city
    }
    
    var removeCityArgument: String!
    func remove(_ city: String) {
        removeCityArgument = city
    }
}
