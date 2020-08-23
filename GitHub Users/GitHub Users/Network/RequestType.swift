//
//  RequestType.swift
//  GitHub Users
//
//  Created by Ramesh B on 22/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import Foundation

enum RequestType {
    case GET
}

// MARK: - Contains supporting Computed properties
extension RequestType {
    
    /// returns: the http method as string
    var method: String {
        switch self {
            case .GET: return "GET"
        }
    }
}

enum APIParams {
    case url([String:Any])
}

extension APIParams {
    
    var asString: String {
        switch self {
        case let .url(parameter):
            return parameter.asQueryString
        }
    }
}

extension Dictionary {
    
    // This computes the asString and appends as parameter for the baseurl to create the request
    var asQueryString: String {
        
        let encodedString = reduce("") { (result, content) in
            var previous_query = result
            if !previous_query.isEmpty {
                previous_query.append("&\(content.key)=\(content.value)")
            } else {
                previous_query.append("?\(content.key)=\(content.value)")
            }
            return previous_query
        }
        
        return encodedString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? encodedString
        
    }
}


