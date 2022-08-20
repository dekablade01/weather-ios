//
//  SavedCitiesService.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 20/8/22.
//

import Foundation

protocol SavedCitiesServiceProtocol {
    
    var cities: [String] { get }
    
    func add(_ city: String)
}

final class SavedCitiesService: SavedCitiesServiceProtocol {
    
    private let storageProvider: StorageProviderProtocol
    
    var cities: [String] {
        storageProvider.value(for: .cityNames) ?? []
    }
    
    init(storageProvider: StorageProviderProtocol) {
        self.storageProvider = storageProvider
    }
    
    func add(_ city: String) {
        var newCities = cities
        newCities.append(city)
        storageProvider.set(newCities, for: .cityNames)
    }
    
    func remove(_ city: String) {
        storageProvider.set(cities.filter { $0 != city }, for: .cityNames)
    }
}
