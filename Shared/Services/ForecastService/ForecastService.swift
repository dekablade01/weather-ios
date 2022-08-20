//
//  ForecastService.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 21/8/22.
//

import Foundation

class ForecastService: ForecastServiceProtocol {
    
    private let requestManger: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManger = requestManager
    }
    
    func weatherForecasts(for cities: [String]) async throws -> [Forecast] {
        var responses = [WeatherResponse]()
        for city in cities {
            print("city: \(city)")
            responses.append(try await requestManger.request(request: .weather(for: city)))
        }
        
        print("## respones: \(responses)")
        return responses.map(\.asForecast)
    }
    
    func fiveDaysForecast(for city: String) async throws -> [Forecast] {
        try await requestManger
            .request(request: .forecast(for: city))
            .forecasts
    }
}
