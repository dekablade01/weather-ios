//
//  Result+SuccessFailure.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import Foundation

extension Result {
    
    var success: Success? {
        switch self {
        case .success(let success):     return success
        case .failure:                  return nil
        }
    }
    
    var failure: Failure? {
        switch self {
        case .success:                  return nil
        case .failure(let failure):     return failure
        }
    }
}
