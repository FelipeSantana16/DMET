//
//  ServiceError.swift
//  DMET
//
//  Created by Felipe Santana on 17/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    
    case invalidURL
    case couldNotDecode
    case failedRequest
    case unknowError(statusCode: Int)
    
}
