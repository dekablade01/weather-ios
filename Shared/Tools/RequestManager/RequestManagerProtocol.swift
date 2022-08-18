//
//  RequestManagerProtocol.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

protocol RequestManagerProtocol {
    
    func request<T: Decodable>(request: Request<T>) async throws -> T
}
