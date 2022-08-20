//
//  WeatherViewFactory.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 21/8/22.
//

import Foundation

@MainActor final class WeatherViewFactory {
    
    private let environment: WeatherApp.Dependencies
    
    init(environment: WeatherApp.Dependencies) {
        self.environment = environment
    }
    
    func citiesList() -> CityWeatherView {
        CityWeatherView(
            viewModel: .init(
                requestManager: environment.openWeatherRequestManager,
                savedCitiesService: environment.savedCitiesService,
                temperatureService: environment.temperatureUnitService
            )
        )
    }
    
    func fiveDaysForecast(for city: String) -> FiveDaysForecastView {
        FiveDaysForecastView(
            viewModel: .init(
                cityName: city,
                requestManager: self.environment.openWeatherRequestManager,
                temperatureService: self.environment.temperatureUnitService
            )
        )
    }
    
}
