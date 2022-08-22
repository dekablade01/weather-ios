//
//  Forecast.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import Foundation

struct Forecast: Identifiable, Equatable {
    
    var id: String {
        [
            cityName,
            temperature.description,
            humidity.description,
            String(describing: iconURL),
            weatherDescription,
            date.description
        ]
            .joined(separator: "-")
    }
    
    let cityName: String
    let temperature: Double
    let humidity: Int
    let iconURL: URL?
    let weatherDescription: String
    let date: Date
    
    init(
        name: String,
        weather: [WeatherResponse.Weather],
        main: WeatherResponse.Main,
        date: Date
    ) {
        let weather = weather[0]
        
        self.cityName = name
        self.temperature = main.temp
        self.humidity = main.humidity
        self.iconURL = weather.iconURL
        self.weatherDescription = weather.description
        self.date = date
    }

}

