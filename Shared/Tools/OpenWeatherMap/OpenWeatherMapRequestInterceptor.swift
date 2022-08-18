//
//  OpenWeatherMapRequestInterceptor.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

struct OpenWeatherMapRequestInterceptor: RequestInterceptorProtocol {
    
    func adapt(_ urlRequest: URLRequest) -> URLRequest {
        guard
            let urlString = urlRequest.url?.absoluteString,
            var components = URLComponents(string: urlString)
        else { return urlRequest }
    
        var urlRequest = urlRequest
        urlRequest.url = components.url
        return urlRequest
    }
}
