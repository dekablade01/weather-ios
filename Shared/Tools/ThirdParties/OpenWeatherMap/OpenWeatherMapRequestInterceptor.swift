//
//  OpenWeatherMapRequestInterceptor.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

struct OpenWeatherMapRequestInterceptor: RequestInterceptorProtocol {

    private let apiKey: String
    private let tempUnitService: TemperatureUnitServiceProtocol
    
    init(apiKey: String, tempUnitService: TemperatureUnitServiceProtocol) {
        self.apiKey = apiKey
        self.tempUnitService = tempUnitService
    }
    
    func adapt(_ urlRequest: URLRequest) -> URLRequest {
        guard
            let urlString = urlRequest.url?.absoluteString,
            var components = URLComponents(string: urlString)
        else { return urlRequest }
        components.queryItems?.append(.init(name: "appid", value: apiKey))
        components.queryItems?.append(.init(name: "units", value: tempUnitService.getCurrentUnit().unitType))
        var urlRequest = urlRequest
        urlRequest.url = components.url
        return urlRequest
    }
}

private extension TemperatureUnit {
    
    var unitType: String {
        switch self {
        case .celsius:      return "metric"
        case .fahrenheit:   return "imperial"
        }
    }
}
