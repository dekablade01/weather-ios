//
//  WeatherApp.swift
//  Shared
//
//  Created by Issarapong Poesua on 18/8/22.
//

import SwiftUI

@main
struct WeatherApp: App {
    
    private let environment = Dependencies()
    private let factory: WeatherViewFactory
    
    init() {
        factory = WeatherViewFactory(environment: environment)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                factory.citiesList()
            }
        }
    }
}
