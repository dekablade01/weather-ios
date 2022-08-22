//
//  Environment.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 22/8/22.
//

import Foundation

enum Environment {
    
    case debug
    case testing
    case release
    
    static var current: Environment {
        #if DEBUG
        return .debug
        #elseif TESTING
        return .testing
        #else
        return .release
        #endif
    }
    
}
