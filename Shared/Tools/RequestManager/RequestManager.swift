//
//  RequestManager.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

protocol RequestManagerProtocol {
    
    func request<T: Decodable>(request: Request<T>) async throws -> T
}


final class RequestManager: RequestManagerProtocol {
    
    private let client: HTTPClientProtocol
    private let adapters: [RequestInterceptorProtocol]
    
    init(client: HTTPClientProtocol, adapters: [RequestInterceptorProtocol]) {
        self.client = client
        self.adapters = adapters
    }
    
    func request<T: Decodable>(request: Request<T>) async throws -> T {
        let request = adapters.reduce(try request.asURLRequest()) { request, interceptor in interceptor.adapt(request) }
        switch try await client.send(request).result {
        case .success(let data):
            return try JSONDecoder().decode(T.self, from: data)
        case .failure(let error):
            throw error
        }
    }

}
