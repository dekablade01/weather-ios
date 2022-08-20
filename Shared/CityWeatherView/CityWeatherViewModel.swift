//
//  CityWeatherViewModel.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import Foundation

protocol CityWeatherViewModelProtocol: ObservableObject {
    
    func fetch() async
        
}

@MainActor final class CityWeatherViewModel: ObservableObject, CityWeatherViewModelProtocol {
  
    let requestManager: RequestManagerProtocol
    private var defaultCity: String
    let temperatureService: TemperatureUnitServiceProtocol
    var nextTemperatureUnitName: String {
        temperatureService.nextUnitType().rawValue.capitalized
    }
    private let savedCitiesService: SavedCitiesServiceProtocol
    @Published private(set) var forecasts: [Forecast] = []
    @Published var currentSearch = ""
    
    init(
        requestManager: RequestManagerProtocol,
        savedCitiesService: SavedCitiesServiceProtocol,
        temperatureService: TemperatureUnitServiceProtocol
    ) {
        self.defaultCity = "Bangkok"
        self.requestManager = requestManager
        self.temperatureService = temperatureService
        self.savedCitiesService = savedCitiesService
    }
    
    func fetch() async {
        if savedCitiesService.cities.isEmpty {
            savedCitiesService.add(defaultCity)
        }

        if !currentSearch.isEmpty {
            savedCitiesService.add(currentSearch)
        }
        await search(cities: savedCitiesService.cities)
    }
    
    private func search(cities names: [String]) async {
        do {
            forecasts = try await names.compactMap {
                 try await requestManager.request(request: .weather(for: $0)).asForecast
            }
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

extension Sequence {
    
    func compactMap<T>(
        _ transform: (Element) async throws -> T?
    ) async rethrows -> [T] {
        var values = [T?]()

        for element in self {
            try await values.append(transform(element))
        }

        return values.compactMap { $0 }
    }
    
    func map<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}
