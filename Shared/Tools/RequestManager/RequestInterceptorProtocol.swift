//
//  RequestInterceptorProtocol.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

protocol RequestInterceptorProtocol {
    
    func adapt(_ urlRequest: URLRequest) -> URLRequest
}
