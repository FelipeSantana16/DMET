//
//  ArtObject.swift
//  DMET
//
//  Created by Felipe Santana on 18/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import Foundation

struct ArtObject: Decodable {
    
    let image: String
    let title: String
    let date: Int
    let artistName: String

    enum CodingKeys: String, CodingKey {
        
        case image = "primaryImageSmall", title, date = "objectEndDate", artistName = "artistDisplayName"
        
    }
}
