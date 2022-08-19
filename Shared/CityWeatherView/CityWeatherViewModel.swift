//
//  CityWeatherViewModel.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import Foundation

protocol CityWeatherViewModelProtocol: ObservableObject {
    
    func fetch() async
        
}

@MainActor final class CityWeatherViewModel: ObservableObject, CityWeatherViewModelProtocol {
  
    let requestManager: RequestManagerProtocol
    private var _cityName: String
    var cityName: String { forecast?.name ?? _cityName }
    let temperatureService: TemperatureUnitServiceProtocol
    var nextTemperatureUnitName: String {
        temperatureService.nextUnitType().rawValue.capitalized
    }
    @Published private(set) var forecast: Forecast?
    @Published var currentSearch = ""
    init(
        cityName: String,
        requestManager: RequestManagerProtocol,
        temperatureService: TemperatureUnitServiceProtocol
    ) {
        self._cityName = cityName
        self.requestManager = requestManager
        self.temperatureService = temperatureService
    }
    
    func fetch() async {
        await search(city: currentSearch.isEmpty ? _cityName : currentSearch)
    }
    
    private func search(city name: String) async {
        do {
            forecast = try await requestManager.request(request: .weather(for: name))
                .asForecast
        } catch {
            print(error)
        }
        currentSearch = ""
    }
    
    func switchTemperatureUnit() {
        temperatureService.switchUnitType()
    }
    
    func formattedTemperature(for double: Double? = 0) -> String {
        TemperatureFormatter().string(for: double ?? 0, with: temperatureService.getCurrentUnit())
    }
}
