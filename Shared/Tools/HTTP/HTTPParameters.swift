//
//  HTTPParameters.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

enum HTTPParameters {
    
    case url([String: String])
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .url(let dictionary):
            return dictionary.map { URLQueryItem(name: $0, value: $1) }
        }
    }
    
}

