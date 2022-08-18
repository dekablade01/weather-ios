//
//  OpenWeatherMapRequests.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

extension Request {
    
    static func weather(for city: String) -> Request<Location> {
        return .init(
            url: "https://api.openweathermap.org/data/2.5/weather",
            method: .get,
            parameters: .url(["q": city, "units": "metric"])
        )
    }
}
