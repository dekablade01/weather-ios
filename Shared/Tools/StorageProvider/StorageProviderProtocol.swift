//
//  StorageProviderProtocol.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import Foundation

protocol StorageProviderProtocol {
    
    func getValue<T>(for key: StorageKeys<T>) -> T?
    
    func set<T>(_ value: T?, for key: StorageKeys<T>)
}
