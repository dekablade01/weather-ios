//
//  Location.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

struct Location: Decodable {
    
    let weather: Weather
    
}

extension Location {
    
    struct Weather: Decodable {
        let main: String
        let description: String
        let icon: String
        var iconURL: URL { URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")! }
    }
    
}
