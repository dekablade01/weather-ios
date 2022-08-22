//
//  UserDefaults+RemoveAll.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 23/8/22.
//

import Foundation

extension UserDefaults {
    
    func removeAll() {
        dictionaryRepresentation().forEach { key, _ in removeObject(forKey: key) }
    }
}
