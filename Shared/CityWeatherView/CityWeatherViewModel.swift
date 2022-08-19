//
//  CityWeatherViewModel.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import Foundation

protocol CityWeatherViewModelProtocol: ObservableObject {
    
    func appear() async
    
    func search(city name: String) async
    
}

@MainActor final class CityWeatherViewModel: ObservableObject, CityWeatherViewModelProtocol {
  
    let requestManager: RequestManagerProtocol
    private var _cityName: String
    var cityName: String { location?.name ?? _cityName }
    @Published private(set) var location: Forecast?
    init(cityName: String, requestManager: RequestManagerProtocol) {
        self._cityName = cityName
        self.requestManager = requestManager
    }
    
    func appear() async {
        await search(city: _cityName)
      
    }
    
    func search(city name: String) async {
        do {
            location = try await requestManager.request(request: .weather(for: name)).asLocation
        } catch {
            print(error)
        }
    }
    
    
}
