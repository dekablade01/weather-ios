//
//  WeatherAppDependencies.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

extension WeatherApp {
    
    
    final class Dependencies {
        
        private let openWeatherRequestManager: RequestManagerProtocol
        private let storageService: StorageProviderProtocol
        let savedCitiesService: SavedCitiesServiceProtocol
        let temperatureUnitService: TemperatureUnitServiceProtocol
        let forecastService: ForecastServiceProtocol
        init() {
            let client = HTTPClient(session: URLSession.shared)
            
            if ProcessInfo.processInfo.arguments.contains("--reset") {
                Constants.storage.removeAll()
            }
            storageService = StorageProvider(
                container: Constants.storage
            )

            let openWeatherInterceptor = OpenWeatherMapRequestInterceptor(
                apiKey: Constants.apiKey,
                tempUnitService: TemperatureUnitService(storageProvider: storageService))
            
            openWeatherRequestManager = RequestManager(
                client: client,
                adapters: [openWeatherInterceptor]
            )
            temperatureUnitService = TemperatureUnitService(storageProvider: storageService)
            savedCitiesService = SavedCitiesService(storageProvider: storageService)
            forecastService = ForecastService(requestManager: openWeatherRequestManager)
        }
        
    }
}

