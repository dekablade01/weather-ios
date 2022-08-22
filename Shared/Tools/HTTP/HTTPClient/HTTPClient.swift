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
                self.session.dataTask(
                    with: request,
                    completionHandler: { data, response, error in
                        if let data = data {
                            con.resume(returning: .init(result: .success(data), urlResponse: response))
                        } else if let error = error {
                            con.resume(returning: .init(result: .failure(error), urlResponse: response))
                        }
                    }
                )
                .resume()
            } catch {
                con.resume(throwing: error)
            }
        }
    }
}
