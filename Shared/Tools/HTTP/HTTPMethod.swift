//
//  HTTPMethod.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

enum HTTPMethod {
    
    case get
    
    var rawValue: String {
        switch self {
        case .get:      return "GET"
        }
    }
}
