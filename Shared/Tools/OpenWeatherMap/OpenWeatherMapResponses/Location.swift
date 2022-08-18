//
//  Location.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

struct Location: Decodable {
    
    let weather: [Weather]
    let name: String
    let main: Main
    let wind: Wind
}

extension Location {
    
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
