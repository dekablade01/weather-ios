//
//  HTTPResponse.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import Foundation

struct HTTPResponse {
    
    let result: Result<Data, Error>
    let urlResponse: URLResponse?
    
}
