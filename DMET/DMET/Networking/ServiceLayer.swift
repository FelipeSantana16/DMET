//
//  ServiceLayer.swift
//  DMET
//
//  Created by Felipe Santana on 17/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import Foundation

struct ServiceLayer {
    
    static func request(route: Router, completion: @escaping (Result<Data?, ServiceError>) -> Void) {
        
        guard let request = route.urlRequest else {
            completion(.failure(ServiceError.failedRequest))
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) {
            data, response, error in
            
            if let _ = error {
                
                completion(.failure(.failedRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            switch response.statusCode {
                
            case 200:
                
            completion(.success(data))
                
            default:
                completion(.failure(.unknowError(statusCode: 400)))
                    
            }
            
        }
        
        dataTask.resume()
    
    }
    
}
