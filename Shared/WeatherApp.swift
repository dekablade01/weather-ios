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
    private let screenFactory: WeatherScreenFactory
    
    init() {
        screenFactory = WeatherScreenFactory(environment: environment)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                screenFactory.citiesList()
            }
        }
    }
}
