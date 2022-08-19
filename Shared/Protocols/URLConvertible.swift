//
//  URLConvertible.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

enum URLConvertibleError: Error {
    
    case isNotConvertible
}

protocol URLConvertible {
    
    func asURL() throws -> URL
}

extension String: URLConvertible {
    
    func asURL() throws -> URL {
        guard let url = URL(string: self) else {
            throw URLConvertibleError.isNotConvertible
        }
        return url
    }
}
