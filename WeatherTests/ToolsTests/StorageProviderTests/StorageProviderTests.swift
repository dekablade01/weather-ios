//
//  StorageProviderTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather

final class StorageProviderTests: XCTestCase {
    
    private var storageProvider: StorageProviderProtocol!
    private var container: ContainerProtocolMock!

    override func setUp() {
        super.setUp()
        container = ContainerProtocolMock()
        storageProvider = StorageProvider(container: container)
    }
    
    func testGetValue() {
        _ = storageProvider.value(for: .cityNames)
        
        // expects that it calls container to get value with given key
        XCTAssertEqual(container.valueArgumentKey, StorageKeys<String>.cityNames.key)
    }
    
    func testSetValue() {
        storageProvider.set("Hello", for: .temperatureDegreeUnit)
        
        // expects that it calls the container to set the value for a particular key
        XCTAssertEqual(
            container.setArgumentKey,
            StorageKeys<String>.temperatureDegreeUnit.key)
        XCTAssertEqual(
            container.setArgumentValue as! String,
            "Hello"
        )
    }
    
}

private class ContainerProtocolMock: ContainerProtocol {
    
    var valueArgumentKey: String!
    var valueForKeyReturnValue: Any!
    func value(forKey: String) -> Any? {
        valueArgumentKey = forKey
        return valueForKeyReturnValue
    }
    
    var setArgumentKey: String!
    var setArgumentValue: Any?
    func set(_ value: Any?, forKey key: String) {
        setArgumentKey = key
        setArgumentValue = value
    }
    
}
