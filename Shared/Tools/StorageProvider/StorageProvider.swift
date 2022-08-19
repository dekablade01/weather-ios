//
//  StorageProvider.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import Foundation

protocol UserDefaultsProtocol {
    
    func value(forKey: String) -> Any?
    func set(_ value: Any?, forKey key: String)
}

extension UserDefaults: UserDefaultsProtocol { }

struct StorageKeys<T> {
    
    let key: String
    
    static var cityNames: StorageKeys<[String]> {
        .init(key: "city_names")
    }
    
    static var temperatureDegreeUnit: StorageKeys<String> {
        .init(key: "temperature_degree_unit")
    }

}
final class StorageProvider: StorageProviderProtocol {
    
    private let container: UserDefaultsProtocol

    init(container: UserDefaultsProtocol = UserDefaults.standard) {
        self.container = container
    }
  
    func getValue<T>(for key: StorageKeys<T>) -> T? {
        return container.value(forKey: key.key) as? T
    }
    
    func set<T>(_ value: T?, for key: StorageKeys<T>) {
        container.set(value, forKey: key.key)
    }
    
}
