//
//  StorageKeys.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 20/8/22.
//

import Foundation

struct StorageKeys<T> {
    
    let key: String
    
    static var cityNames: StorageKeys<[String]> {
        .init(key: "city_names")
    }
    
    static var temperatureDegreeUnit: StorageKeys<String> {
        .init(key: "temperature_degree_unit")
    }

}
