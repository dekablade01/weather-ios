//
//  SavedCitiesService.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 20/8/22.
//

import Foundation

final class SavedCitiesService: SavedCitiesServiceProtocol {
    
    private let storageProvider: StorageProviderProtocol
    
    var cities: [String] {
        return storageProvider.value(for: .cityNames) ?? []
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
