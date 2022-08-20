//
//  HTTPClient.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

final class HTTPClient: HTTPClientProtocol {
    
    private let session: URLSessionProtocol
    init(

        session: URLSessionProtocol
    ) {
        self.session = session
    }
    
    func send(_ request: URLRequestConvertible) async throws -> HTTPResponse {
        try await withCheckedThrowingContinuation { [unowned self] con in
            do {
                let request = try request.asURLRequest()
                self.makeHTTPRequest(from: request) {
                    print("## http_response: \($0)")
                    con.resume(returning: $0)
                    
                }
            } catch {
                con.resume(throwing: error)
            }
        }
    }
}


// MARK: - private helpers

extension HTTPClient {
    
    private func makeHTTPRequest(
        from request: URLRequest,
        completion: @escaping (HTTPResponse) -> Void
    ) {
        session.dataTask(
            with: request,
            completionHandler: { data, response, error in
                if let data = data {
                    completion(.init(result: .success(data), urlResponse: response))
                } else if let error = error {
                    completion(.init(result: .failure(error), urlResponse: response))
                }
            }
        )
        .resume()
        
    }
    
}
