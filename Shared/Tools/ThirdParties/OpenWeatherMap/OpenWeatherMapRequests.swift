//
//  OpenWeatherMapRequests.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

struct OpenWeatherMapRequests {
    
    private static var baseURL: URL {
        return URL(string: "https://api.openweathermap.org")!
    }
    
    static func weather(for city: String) -> Request<WeatherResponse> {
        return .init(
            url: baseURL.appendingPathComponent("/data/2.5/weather"),
            method: .get,
            parameters: .url(["q": city])
        )
    }
    
    static func forecast(for city: String) -> Request<ForecastResponse> {
        return .init(
            url: baseURL.appendingPathComponent("/data/2.5/forecast"),
            method: .get,
            parameters: .url(["q": city])
        )
    }
}
