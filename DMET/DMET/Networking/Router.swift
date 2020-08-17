//
//  Router.swift
//  DMET
//
//  Created by Felipe Santana on 16/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import Foundation


enum Router {
    
    
    //Endpoints
    case getAllArtObjects(metaDataDate: Date? = nil, departmentsIds: [Int]? = nil)
    case getArtObject(objectId: Int? = nil)
    case getAllArtDepartments
    case search(q: String?, isHighlight: Bool? = nil, departmentId: Int? = nil, isOnView: Bool? = nil, artistOrCulture: Bool? = nil, medium: [String]? = nil, hasImage: Bool? = nil, geoLocation: [String]? = nil, dateBeginAndDateEnd: [Int]? = nil)
    
    
    var scheme: String {
        
        return "https"
        
    }
    
    var host: String {
        
        return "collectionapi.metmuseum.org"
        
    }
    
    var path: String {
        
        switch self {
            
            case .getAllArtObjects:
                    
                return "/public/collection/v1/objects"
                
                
            case .getArtObject(let objectId):
                
                if let objectId = objectId{
                
                    return "/public/collection/v1/objects/\(objectId)"
                    
                } else {
                    
                    return "/public/collection/v1/objects"
                
                }
                
                
            case .getAllArtDepartments:
                
                return "/public/collection/v1/departments"
            
                
            case .search:
                
                return "/public/collection/v1/search"
            
        }
        
    }
    
    var params: [URLQueryItem] {
        
        var queryItems: [URLQueryItem] = []
        
        
        switch self {
            
            case .getAllArtObjects(let metaDataDate, let departmentsIds):
                
                
                
                guard let metaDataDate = metaDataDate else {
                    
                    print("Empty MetadataDate")
                    fatalError()
                }
                
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd"
                let date = df.string(from: metaDataDate)
                
                
                guard let departmentsIds = departmentsIds else {
                    
                    print("Empty Departments Ids")
                    fatalError()
                }
            
                var ids = ""
                for i in 0...departmentsIds.count {
                    
                    if(i == departmentsIds.count){
                        ids += String(departmentsIds[i])
                    }
                    
                    ids += String(departmentsIds[i]) + "|"
                }
            
                queryItems.append(contentsOf: [
                    URLQueryItem(name: "metadataDate", value: date),
                    URLQueryItem(name: "departmentsIds", value: ids)
                ])
                
                break
            
            case .getArtObject:
                break
            
            case .getAllArtDepartments:
                break
            
            case .search(let q, let isHighlight, let departmentId, let isOnView, let artistOrCulture, let medium, let hasImage, let geoLocation, let dateBeginAndDateEnd):
                
                guard let isHighlight = isHighlight else {
                    
                    print("Empty isHighlight")
                    fatalError()
                    
                }
                
                let highlight = String(isHighlight)
                
                guard let departmentId = departmentId else {
                    
                    print("Empty departmentId")
                    fatalError()
                }
                
                let id = String(departmentId)
                
                guard let isOnView = isOnView else {
                    
                    print("Empty isOnView")
                    fatalError()
                    
                }
                
                let view = String(isOnView)
                
                guard let artistOrCulture = artistOrCulture else {
                    
                    print("Empty artistOrCulture")
                    fatalError()
                    
                }
                
                let artistCulture = String(artistOrCulture)
                
                guard let medium = medium else {
                    
                    print("Empty medium")
                    fatalError()
                    
                }
                
                var mediumStr = ""
                
                for i in 0...medium.count {
                    
                    if(i == medium.count){
                        
                        mediumStr += medium[i]
                        
                    }
                    
                    mediumStr += medium[i] + " | "
                    
                }
                
                guard let hasImage = hasImage else {
                    
                    print("Empty hasImage")
                    fatalError()
                    
                }
                
                let image = String(hasImage)
                
                guard let geoLocation = geoLocation else {
                    
                    print("Empty geoLocation")
                    fatalError()
                }
                
                var location = ""
                
                for i in 0...geoLocation.count {
                    
                    location += geoLocation[i] + " | "
                    
                }
                
                guard let dateBeginAndEndDate = dateBeginAndDateEnd else {
                    
                    print("Empty dateBeginAndEndDate")
                    fatalError()
                    
                }
                
                let dateBegin = String(dateBeginAndEndDate[0])
                let dateEnd = String(dateBeginAndEndDate[1])
                
                
                guard let q = q else {
                    
                    print("Empty Query")
                    fatalError()
                    
                }
                
                queryItems.append(contentsOf: [
                    URLQueryItem(name: "isHighlight", value: highlight),
                    URLQueryItem(name: "departmentId", value: id),
                    URLQueryItem(name: "isOnView", value: view),
                    URLQueryItem(name: "artistOrCulture", value: artistCulture),
                    URLQueryItem(name: "medium", value: mediumStr),
                    URLQueryItem(name: "hasImage", value: image),
                    URLQueryItem(name: "geoLocation", value: location),
                    URLQueryItem(name: "dateBegin", value: dateBegin),
                    URLQueryItem(name: "dateEnd", value: dateEnd),
                    URLQueryItem(name: "q", value: q)
                ])
                
                break
            
        }
        
        return queryItems
        
    }
    
    
    var method: String {
        
        switch self {
        
        case .getAllArtDepartments:
            return "GET"
            
        case .getAllArtObjects:
            return "GET"
            
        case .getArtObject:
            return "GET"
            
        case .search:
            return "GET"
            
        }
        
    }
    
    var url: URL? {
        
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path
        if !self.params.isEmpty {
            
            components.queryItems = self.params
            
        }
        
        return components.url
        
    }
    
    var urlRequest: URLRequest? {
        
        guard let url = self.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.method
        
        return request
    }
}
