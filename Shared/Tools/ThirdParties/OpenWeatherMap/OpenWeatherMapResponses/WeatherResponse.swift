//
//  WeatherResponse.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

struct WeatherResponse: Decodable {
    
    let weather: [Weather]
    let name: String
    let main: Main

    var asForecast: Forecast {
        return Forecast(
            name: name,
            weather: weather,
            main: main,
            date: .now
        )
    }
}

extension WeatherResponse {
    
    struct Wind: Decodable {
        let speed: Double
    }
    struct Main: Decodable {
        let temp: Double
        let humidity: Int
    }
    
    struct Weather: Decodable {
        let main: String
        let description: String
        private let icon: String
        // force_unwrap_exception
        var iconURL: URL { URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")! }
    }
    
}
