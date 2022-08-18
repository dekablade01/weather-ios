//
//  KrungsriAssignmentApp.swift
//  Shared
//
//  Created by Issarapong Poesua on 18/8/22.
//

import SwiftUI

@main
struct KrungsriAssignmentApp: App {
    
    private let environment = Environment()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CityWeatherView(viewModel: .init(cityName: "Bangkok", requestManager: environment.openWeatherRequestManager))
            }
        }
    }
}
