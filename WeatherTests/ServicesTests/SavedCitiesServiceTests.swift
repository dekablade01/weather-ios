//
//  SavedCitiesServiceTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather

final class SavedCitiesServiceTests: XCTestCase {
    
    private var service: SavedCitiesServiceProtocol!
    private var mock: StorageProviderProtocolMock!
    
    override func setUp() {
        super.setUp()
        mock = .init()
        service = SavedCitiesService(storageProvider: mock)
    }
    
    func testAddCity() {
        service.add("Bangkok")

        XCTAssertEqual(mock.setArgument!.key, "city_names")
        XCTAssertEqual(mock.setArgument!.value as! [String], ["Bangkok"])
    }
    
    func testGetCities() {
        mock.valueReturnValue = ["Bangkok", "Phuket"]
        
        XCTAssertEqual(service.cities, ["Bangkok", "Phuket"])
        XCTAssertEqual(mock.valueArgumentKey, "city_names")
    }
    
    func testRemoveCity() {
        mock.valueReturnValue = ["Bangkok", "Phuket"]

        service.remove("Bangkok")
        XCTAssertEqual(mock.setArgument?.key, "city_names")
        XCTAssertEqual(mock.setArgument?.value as! [String], ["Phuket"])
    }
}

private final class StorageProviderProtocolMock: StorageProviderProtocol {
    
    var setArgument: (value: Any?, key: String)?
    func set<T>(_ value: T?, for key: StorageKeys<T>) {
        setArgument = (value: value, key: key.key)
    }

    var valueArgumentKey: String?
    var valueReturnValue: Any!
    func value<T>(for key: StorageKeys<T>) -> T? {
        valueArgumentKey = key.key
        return valueReturnValue as? T
    }
}
