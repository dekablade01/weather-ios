//
//  WeatherViewFactory.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 21/8/22.
//

import SwiftUI

@MainActor final class WeatherScreenFactory {
    
    static let preview = WeatherScreenFactory(environment: .init())
    
    private let environment: WeatherApp.Dependencies
    
    init(environment: WeatherApp.Dependencies) {
        self.environment = environment
    }
    
    func citiesList() -> some View {
        CityWeatherView(
            viewFactory: self,
            viewModel: .init(
                forecastService: environment.forecastService,
                savedCitiesService: environment.savedCitiesService,
                temperatureService: environment.temperatureUnitService
            )
        )
    }
    
    func fiveDaysForecast(for city: String) -> some View {
        FiveDaysForecastView(
            viewModel: .init(
                cityName: city,
                forecastService: self.environment.forecastService,
                temperatureService: self.environment.temperatureUnitService
            )
        )
    }
    
}
