//
//  KrungsriAssignmentAppViewModel.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

final class Environment {
    
    let openWeatherRequestManager: RequestManagerProtocol
    let storageService: StorageProviderProtocol
    
    init() {
        let client = HTTPClient(session: .shared)
        storageService = StorageProvider(container: UserDefaults.standard)

        let openWeatherInterceptor = OpenWeatherMapRequestInterceptor(
            apiKey: "9d28603867b48a09484cedbd79d412af",
            tempUnitService: TemperatureUnitService(storageProvider: storageService))
        
        openWeatherRequestManager = RequestManager(
            client: client,
            adapters: [openWeatherInterceptor]
        )
    }
    
}
