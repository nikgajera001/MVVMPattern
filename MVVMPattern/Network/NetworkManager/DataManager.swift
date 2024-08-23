//
//  DataManager.swift
//
//  Created by iOS on 07/10/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation
import Alamofire

class DataManager: NSObject {
    
    // MARK:- Variables
    
    static let shared   = DataManager()
    let baseUrl         = WebServiceURL.local
    
    // Create http headers
    func getHttpHeaders() -> HTTPHeaders {
        var httpHeader = HTTPHeaders()
        httpHeader["Accept"] = "application/json"
        httpHeader["Content-Type"] = "application/json"
        return httpHeader
    }
    

    // MARK:- Custom Methods
    
    // Get API url with endpoints
    func getURL(_ endpoint: WSEndPoints) -> String {
        return baseUrl + endpoint.rawValue
    }
}


// MARK:- WebserviceURL

struct WebServiceURL {
    static let local        = "http://jsonplaceholder.typicode.com/"
}


// MARK:- WebserviceEndPoints

enum WSEndPoints: String {
    case post                       = "posts"
    case users                      = "users"
    case comments                   = "comments"
}


// MARK:- enum - Result

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}


// MARK:- enum - APIError

enum APIError: Error {
    case errorMessage(String)
    case requestFailed(String)
    case jsonConversionFailure(String)
    case invalidData(String)
    case responseUnsuccessful(String)
    case jsonParsingFailure(String)
    
    var localizedDescription: String {
        
        switch self {
            
        case.errorMessage(let msg):
            return msg
            
        case .requestFailed(let msg):
            return msg
            
        case .jsonConversionFailure(let msg):
            return msg
            
        case .invalidData(let msg):
            return msg
            
        case .responseUnsuccessful(let msg):
            return msg
            
        case .jsonParsingFailure(let msg):
            return msg
        }
    }
}
