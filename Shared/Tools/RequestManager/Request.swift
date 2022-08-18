//
//  Request.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

struct Request<T>: URLRequestConvertible {
    
    let url: URLConvertible
    let method: HTTPMethod
    let parameters: HTTPParameters
    
    init(url: URLConvertible, method: HTTPMethod, parameters: HTTPParameters) {
        self.url = url
        self.method = method
        self.parameters = parameters
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponent = URLComponents(string: try url.asURL().absoluteString)
        urlComponent?.queryItems = parameters.queryItems
        
        guard let url = urlComponent?.url else { throw NSError() }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
