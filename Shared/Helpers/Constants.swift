//
//  Constants.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 22/8/22.
//

import Foundation

struct Constants {
        
    @Credential(
        debug: "9d28603867b48a09484cedbd79d412af",
        release: "9d28603867b48a09484cedbd79d412af"
    )
    static var apiKey
    
    @Credential(
        debug: UserDefaults(suiteName: "-debug")!,
        testing: UserDefaults(suiteName: "-testing-\(UUID().uuidString)")!,
        release: UserDefaults(suiteName: "-release")!
    )
    static var storage
}
