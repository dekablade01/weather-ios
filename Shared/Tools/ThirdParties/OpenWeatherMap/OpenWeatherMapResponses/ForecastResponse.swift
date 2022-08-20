//
//  ForecastResponse.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import Foundation

struct ForecastResponse: Decodable {
    
    let city: City
    let list: [Item]
    
    var asLocations: [Forecast] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return list.compactMap { item in
            Forecast(
                name: city.name,
                weather: item.weather,
                main: item.main,
                wind: item.wind,
                date: dateFormatter.date(from: item.dt_txt) ?? .now
            )
        }
    }
}

extension ForecastResponse {
    
    struct Item: Decodable {
        let main: WeatherResponse.Main
        let weather: [WeatherResponse.Weather]
        let wind: WeatherResponse.Wind
        let dt_txt: String
    }
    
    struct City: Decodable {
        let name: String
    }
}
