//
//  ContainerProtocol.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 20/8/22.
//

import Foundation

protocol ContainerProtocol {
    
    func value(forKey: String) -> Any?
    func set(_ value: Any?, forKey key: String)
}

extension UserDefaults: ContainerProtocol { }
