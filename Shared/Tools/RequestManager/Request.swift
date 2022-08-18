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
    
    init(url: URLConvertible, method: HTTPMethod) {
        self.url = url
        self.method = method
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: try url.asURL())
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
