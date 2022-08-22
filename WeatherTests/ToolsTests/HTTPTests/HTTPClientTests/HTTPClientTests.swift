//
//  HTTPClientTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather

final class HTTPClientTests: XCTestCase {
    
    private var client: HTTPClient!
    private var urlSession: URLSessionProtocolMock!
    
    override func setUp() {
        super.setUp()
        urlSession = .init()
        client = HTTPClient(session: urlSession)
    }
    
    func testSendAndReceiveSuccessResponse() async {
        let urlRequest = URLRequest(url: URL(string: "https://issarapong.me")!)

        urlSession.dataTaskReturnData = "Hello".utf8Data

        let response = try! await client.send(urlRequest)
        XCTAssertEqual(response.result.success, urlSession.dataTaskReturnData)
    }
    
    func testSendAndReceiveFailureResponse() async {
        let urlRequest = URLRequest(url: URL(string: "https://issarapong.me")!)

        urlSession.dataTaskError = URLConvertibleError.isNotConvertible
    
        let response = try! await client.send(urlRequest)
        
        XCTAssertEqual(
            response.result.failure as! URLConvertibleError,
            URLConvertibleError.isNotConvertible
        )
    }
}

private class URLSessionProtocolMock: URLSessionProtocol {
    
    var dataTaskReceivedArgument: (request: URLRequest, completionHandler: (Data?, URLResponse?, Error?) -> Void)!
    var dataTaskReturnValue: URLSessionDataTask!
    var dataTaskReturnData: Data?
    var dataTaskURLResponse: URLResponse?
    var dataTaskError: Error?
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskReceivedArgument = (request: request, completionHandler: completionHandler)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completionHandler(self.dataTaskReturnData, self.dataTaskURLResponse, self.dataTaskError)

        }
        return URLSession.shared.dataTask(with: request, completionHandler: {_, _, _ in })
        
    }
}
