//
//  StorageProvider.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import Foundation



protocol StorageProviderProtocol {
    
    func value<T>(for key: StorageKeys<T>) -> T?
    
    func set<T>(_ value: T?, for key: StorageKeys<T>)
}

final class StorageProvider: StorageProviderProtocol {
    
    private let container: ContainerProtocol

    init(container: ContainerProtocol = UserDefaults.standard) {
        self.container = container
    }
  
    func value<T>(for key: StorageKeys<T>) -> T? {
        return container.value(forKey: key.key) as? T
    }
    
    func set<T>(_ value: T?, for key: StorageKeys<T>) {
        container.set(value, forKey: key.key)
    }
    
}
