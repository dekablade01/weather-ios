//
//  ForecastService.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 21/8/22.
//

import Foundation

final class ForecastService: ForecastServiceProtocol {
    
    private let requestManger: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManger = requestManager
    }
    
    func weatherForecasts(for cities: [String]) async throws -> [Forecast] {
        try await cities.asyncMap {
            try await requestManger.request(request: OpenWeatherMapRequests.weather(for: $0)).asForecast
        }
    }
    
    func fiveDaysForecast(for city: String) async throws -> [Forecast] {
        try await requestManger
            .request(request: OpenWeatherMapRequests.forecast(for: city))
            .asForecasts
    }
}
