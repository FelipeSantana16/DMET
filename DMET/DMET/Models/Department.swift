//
//  Department.swift
//  DMET
//
//  Created by Felipe Santana on 19/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import Foundation

struct  AllDepartaments: Decodable {
    
    let departments: [Department]
}

struct Department: Decodable {
    
    let displayName: String
    let departmentId: Int
    
}

struct ResponseObjects: Decodable {
    
    let total: Int32
    let objectIDs: [Int]
    
}
