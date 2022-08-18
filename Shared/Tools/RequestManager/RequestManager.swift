//
//  RequestManager.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

final class RequestManager: RequestManagerProtocol {
    
    private let client: HTTPClientProtocol
    
    init(client: HTTPClientProtocol) {
        self.client = client
    }
    
    func request<T: Decodable>(request: Request<T>) async throws -> T {
        switch try await client.send(request).result {
        case .success(let data): return try JSONDecoder().decode(T.self, from: data)
        case .failure(let error): throw error
        }
    }

}
