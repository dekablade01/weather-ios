//
//  RequestTests.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import XCTest
@testable import Weather

final class RequestTests: XCTestCase {
    
    private var convertible: URLRequestConvertible!
    private var requestAsRequest: Request<String>! { (convertible as! Request<String>) }
    
    override func setUp() {
        super.setUp()
        convertible = Request<String>(
            url: "https://issarapong.me/cv",
            method: .get,
            parameters: .url(["q": "bangkok"])
        )
    }
    
    func testConvertingToURLRequest() {
        let urlRequest = try! convertible.asURLRequest()
        let components = URLComponents(string: urlRequest.url!.absoluteString)!
        
        // expects that the function converts it into url correctly.
        XCTAssertEqual(components.scheme, "https")
        XCTAssertEqual(components.host, "issarapong.me")
        XCTAssertEqual(components.path, "/cv")
        XCTAssertEqual(components.queryItems, [URLQueryItem(name: "q", value: "bangkok")])
    }
    
    func testConvertingToURLRequestFailed() {
        // expects that the function throws error cause url is not convertible.
        XCTAssertThrowsError(try Request<String>(url: "  6^3261-38fowefjasf ", method: .get, parameters: .url([:])).asURLRequest())
    }
}
