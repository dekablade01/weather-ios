//
//  URLSessionProtocol.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 21/8/22.
//

import Foundation

protocol URLSessionProtocol {
    
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask
    
}

extension URLSession: URLSessionProtocol { }
