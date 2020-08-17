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
                
                
                
                if let metaDataDate = metaDataDate {
                    
                    let df = DateFormatter()
                    df.dateFormat = "yyyy-MM-dd"
                    let date = df.string(from: metaDataDate)
                    
                    queryItems.append(URLQueryItem(name: "metadataDate", value: date))
                    
                }
                
                if let departmentsIds = departmentsIds {
                   
                    var ids = ""
                    for i in 0...departmentsIds.count {
                        
                        if(i == departmentsIds.count){
                            ids += String(departmentsIds[i])
                        }
                        
                        ids += String(departmentsIds[i]) + "|"
                    }
                    
                    queryItems.append(URLQueryItem(name: "departmentsIds", value: ids))
                   
                }
                
                break
            
            case .getArtObject:
                break
            
            case .getAllArtDepartments:
                break
            
            case .search(let q, let isHighlight, let departmentId, let isOnView, let artistOrCulture, let medium, let hasImage, let geoLocation, let dateBeginAndDateEnd):
                
                
                if let isHighlight = isHighlight {
                    
                    let highlight = String(isHighlight)
                    
                    queryItems.append(URLQueryItem(name: "isHighlight", value:highlight))
                    
                }
                
                if let departmentId = departmentId {
                    
                    let id = String(departmentId)
                    
                    queryItems.append(URLQueryItem(name: "departmentId", value: id))
                    
                }
                
                if let isOnView = isOnView {
                    
                    let view = String(isOnView)
                    
                    queryItems.append(URLQueryItem(name: "isOnView", value: view))
                }
                
                
                
                if let artistOrCulture = artistOrCulture {
                    
                    let artistCulture = String(artistOrCulture)
                    
                    queryItems.append(URLQueryItem(name: "artistOrCulture", value: artistCulture))
                    
                }
                
                
                
                if let medium = medium {
                    
                    var mediumStr = ""
                    
                    for i in 0...medium.count {
                        
                        if(i == medium.count){
                            
                            mediumStr += medium[i]
                            
                        }
                        
                        mediumStr += medium[i] + " | "
                        
                    }
                    
                    queryItems.append(URLQueryItem(name: "medium", value: mediumStr))
                    
                }
                
                
                
                if let hasImage = hasImage {
                    
                    let image = String(hasImage)
                    
                    
                    queryItems.append(URLQueryItem(name: "hasImage", value: image))
                    
                }
                
                
                
                if let geoLocation = geoLocation {
                    
                    var location = ""
                    
                    for i in 0...geoLocation.count {
                        
                        location += geoLocation[i] + " | "
                        
                    }
                    
                    queryItems.append(URLQueryItem(name: "geoLocation", value: location))
                    
                }
                
                
                
                if let dateBeginAndEndDate = dateBeginAndDateEnd {
                    
                    let dateBegin = String(dateBeginAndEndDate[0])
                    let dateEnd = String(dateBeginAndEndDate[1])
                    
                    queryItems.append(URLQueryItem(name: "dateBegin", value: dateBegin))
                    queryItems.append(URLQueryItem(name: "dateEnd", value: dateEnd))
                    
                }
                
                
                if let q = q {
                    
                    queryItems.append(URLQueryItem(name: "q", value: q))
                    
                }
                
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
