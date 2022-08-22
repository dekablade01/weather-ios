//
//  CityWeatherViewModel.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import Foundation

protocol CityWeatherViewModelProtocol {
    func addCity(_ city: String)
    func delete(_ cityName: String?)
    func refresh()
    func switchTemperatureUnit()
    func formattedTemperature(for double: Double?) -> String
    func forecastItem(forecast: Forecast) -> WeatherCardView.Model
}

final class CityWeatherViewModel: ObservableObject, CityWeatherViewModelProtocol {
    
    let forecastService: ForecastServiceProtocol
    let temperatureService: TemperatureUnitServiceProtocol
    var nextTemperatureUnitName: String {
        temperatureService.nextUnitType().rawValue.capitalized
    }
    private let savedCitiesService: SavedCitiesServiceProtocol
    private var forecasts: [Forecast] = [] {
        didSet { weatherModels = forecasts.map(forecastItem) }
    }
    @Published private(set) var weatherModels: [WeatherCardView.Model] = []
    
    @Published var error: Error?
    
    init(
        forecastService: ForecastServiceProtocol,
        savedCitiesService: SavedCitiesServiceProtocol,
        temperatureService: TemperatureUnitServiceProtocol
    ) {
        self.forecastService = forecastService
        self.temperatureService = temperatureService
        self.savedCitiesService = savedCitiesService
    }
    
    func addCity(_ city: String) {
        guard !city.isEmpty else { return }
        savedCitiesService.add(city)
    }
    
    func refresh() {
        Task { await search(cities: savedCitiesService.cities) }
    }
    
    func delete(_ cityName: String?) {
        guard let cityName = cityName else { return }
        savedCitiesService.remove(cityName)
        forecasts = forecasts.filter { $0.cityName != cityName }
    }
    
    func switchTemperatureUnit() {
        temperatureService.switchUnitType()
    }
    
    func formattedTemperature(for double: Double?) -> String {
        guard
            let double = double,
            let string = TemperatureFormatter()
                .string(for: double, with: temperatureService.getCurrentUnit())
        else { return "" }
        return string
    }
    
    func forecastItem(forecast: Forecast) -> WeatherCardView.Model {
        return .init(
            cityName: forecast.cityName,
            weatherIconURL: forecast.iconURL,
            weatherDescription: forecast.weatherDescription,
            temperature: formattedTemperature(for: forecast.temperature),
            humidity: forecast.humidity
        )
    }
}

// MARK: - helpers

extension CityWeatherViewModel {

    private func search(cities names: [String]) async {
        do {
            let _forecasts = try await forecastService.weatherForecasts(for: names)
            DispatchQueue.main.async { self.forecasts = _forecasts }
        } catch {
            DispatchQueue.main.async { self.error = error }
        }
    }
}
