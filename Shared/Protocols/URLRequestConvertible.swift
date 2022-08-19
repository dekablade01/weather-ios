//
//  URLRequestConvertible.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

enum URLRequestConvertibleError: Error {
    
    case isNotConvertible
}

protocol URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest
    
}

extension URLRequest: URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest {
        return self
    }
}
