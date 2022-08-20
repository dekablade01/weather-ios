//
//  OpenWeatherMapRequests.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

extension Request {
    
    static func weather(for city: String) -> Request<WeatherResponse> {
        return .init(
            url: "https://api.openweathermap.org/data/2.5/weather",
            method: .get,
            parameters: .url(["q": city])
        )
    }
    
    static func forecast(for city: String) -> Request<ForecastResponse> {
        return .init(
            url: "https://api.openweathermap.org/data/2.5/forecast",
            method: .get,
            parameters: .url(["q": city])
        )
    }
}
