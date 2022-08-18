//
//  OpenWeatherMapRequestInterceptor.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

struct OpenWeatherMapRequestInterceptor: RequestInterceptorProtocol {

    private let apiKey: String
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func adapt(_ urlRequest: URLRequest) -> URLRequest {
        guard
            let urlString = urlRequest.url?.absoluteString,
            var components = URLComponents(string: urlString)
        else { return urlRequest }
    
        components.queryItems?.append(.init(name: "appid", value: apiKey))

        var urlRequest = urlRequest
        urlRequest.url = components.url
        return urlRequest
    }
}
