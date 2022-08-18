//
//  CityWeatherViewModel.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import Foundation

protocol CityWeatherViewModelProtocol: ObservableObject {
    
    func appear() async
    
    func searchDidTap()
}

final class CityWeatherViewModel: ObservableObject, CityWeatherViewModelProtocol {

  
    private let requestManager: RequestManagerProtocol
    private var cityName: String
    @Published private(set) var location: Location?
    init(cityName: String, requestManager: RequestManagerProtocol) {
        self.cityName = cityName
        self.requestManager = requestManager
    }
    
    func appear() async {
    
        do {
            location = try await requestManager.request(request: .weather(for: "Bangkok"))
        } catch {
            print(error)
        }
    }
    
    func searchDidTap() {
        
    }
    
    
}
