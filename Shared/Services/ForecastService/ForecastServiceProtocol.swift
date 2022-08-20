//
//  ForecastServiceProtocol.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 21/8/22.
//

import Foundation

protocol ForecastServiceProtocol {
    
    func weatherForecasts(for cities: [String]) async throws -> [Forecast]
    
    func fiveDaysForecast(for city: String) async throws -> [Forecast]
}
