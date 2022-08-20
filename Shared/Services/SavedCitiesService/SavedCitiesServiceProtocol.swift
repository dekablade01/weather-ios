//
//  SavedCitiesServiceProtocol.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 21/8/22.
//

import Foundation

protocol SavedCitiesServiceProtocol {
    
    var cities: [String] { get }
    
    func add(_ city: String)
    
    func remove(_ city: String)
}
