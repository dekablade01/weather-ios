//
//  RequestManagerTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather

final class RequestManagerTests: XCTestCase {
    
    private var httpClient: HTTPClientProtocolMock!
    private var requestManager: RequestManagerProtocol!
    
    override func setUp() {
        super.setUp()
        httpClient = HTTPClientProtocolMock()
        requestManager = RequestManager(
            client: httpClient,
            adapters: []
        )
    }
    
    func testSendingRequestAndSucceed() async {
        let data = """
        {
            "weather": [
                {
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "main": {
                "temp": 26.83,
                "humidity": 88
            },
            "name": "Bangkok",
        }
        """.utf8Data
        
        httpClient.httpReponse = .init(result: .success(data), urlResponse: nil)
        let response = try! await requestManager.request(request: OpenWeatherMapRequests.weather(for: "Bangkok"))
        XCTAssertEqual(response.name, "Bangkok")
    }
    
    
    func testSendingRequestAndFailed() async {
        httpClient.httpReponse = .init(result: .failure(URLConvertibleError.isNotConvertible), urlResponse: nil)
        
        let expectation = XCTestExpectation()
        do {
            _ = try await requestManager.request(request: OpenWeatherMapRequests.weather(for: "Bangkok"))
        } catch {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
private class HTTPClientProtocolMock: HTTPClientProtocol {
    
    var httpReponse: HTTPResponse!
    func send(_ request: URLRequestConvertible) async throws -> HTTPResponse {
        return httpReponse
    }
    
}

extension String {
    
    
    var utf8Data: Data {
        Data(utf8)
    }
}
