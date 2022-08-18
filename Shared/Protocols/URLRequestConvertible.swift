//
//  URLRequestConvertible.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

protocol URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest
    
}
