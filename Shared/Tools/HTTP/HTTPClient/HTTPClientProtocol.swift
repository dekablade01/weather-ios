//
//  HTTPClientProtocol.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

protocol HTTPClientProtocol {
    
    func send(_ request: URLRequestConvertible) async throws -> HTTPResponse
    
}
