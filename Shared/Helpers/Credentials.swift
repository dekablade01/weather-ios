//
//  Credentials.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 22/8/22.
//

import Foundation

@propertyWrapper struct Credential<T> {
    
    var wrappedValue: T
    
    init(debug: T, testing: T? = nil, release: T? = nil) {
        switch Environment.current {
        case .debug:    wrappedValue = debug
        case .testing:  wrappedValue = testing ?? debug
        case .release:  wrappedValue = release ?? debug
        }
    }
}
