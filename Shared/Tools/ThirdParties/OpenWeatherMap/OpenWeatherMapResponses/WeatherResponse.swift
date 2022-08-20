//
//  WeatherResponse.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

struct Forecast: Identifiable {

    let id = UUID().uuidString
    
    let cityName: String
    let windSpeed: Double
    let temperature: Double
    let humidity: Int
    let iconURL: URL?
    let weatherDescription: String
    let date: Date
    
    init(
        name: String,
        weather: [WeatherResponse.Weather],
        main: WeatherResponse.Main,
        wind: WeatherResponse.Wind,
        date: Date
    ) {
        let weather = weather[0]
        
        self.cityName = name
        self.windSpeed = wind.speed
        self.temperature = main.temp
        self.humidity = main.humidity
        self.iconURL = weather.iconURL
        self.weatherDescription = weather.description
        self.date = date
    }
    
    init(name: String, windSpeed: Double, temperature: Double, humidity: Int, iconURL: URL?, weatherDescription: String, date: Date) {
        self.cityName = name
        self.windSpeed = windSpeed
        self.temperature = temperature
        self.humidity = humidity
        self.iconURL = iconURL
        self.weatherDescription = weatherDescription
        self.date = date
    }

}

struct WeatherResponse: Decodable {
    
    let weather: [Weather]
    let name: String
    let main: Main
    let wind: Wind

    var asForecast: Forecast {
        return Forecast(
            name: name,
            weather: weather,
            main: main,
            wind: wind,
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
        var iconURL: URL { URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")! }
    }
    
}
