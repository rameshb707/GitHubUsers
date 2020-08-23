//
//  HttpValidation.swift
//  GitHub Users
//
//  Created by Ramesh B on 22/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import Foundation

/// Represents the response from the server
///
/// - Success: The network operation succedded
/// - Error: The network operation failed and contains the error information
public enum ResponseStatus {
    /// The network operation succedded
    case success
    /// The network operation failed and contains the error information
    case error(GitHubUserError)
}

/// Reprents all the validation rules for a successful network request
struct Validation {
    /// Contains a list of all the accepted status codes
    static let acceptedStatusCode: [Int] = Array(200..<300)

    static let badRequestStatusCode: Int = 400
    
    static let unauthorizedStatusCode: Int = 401
    
    static let notFoundStatusCode: Int = 404
    
    
    static let serviceTempNotAvailableStatusCode: Int = 503

    
    /**
        To check if the status code of the response is valid
     
           - Parameter response: The actual HTTURLPResponse from server
           - Returns: True if the response statuscode is valid / accepted
    */
    static func isAcceptedStatus(response: HTTPURLResponse?) -> Bool {
        if let statusCode = response?.statusCode , acceptedStatusCode.contains(statusCode) {
            return true
        }
        return false
    }

    /**
        This method is used to check if the response content type if application/json
     
           - Parameter response: The actual HTTURLPResponse from server
           - Returns: true if the response content-type is application/json
    */
    static func isAcceptedContentTypeForData(response: HTTPURLResponse?) -> Bool {
        if let responseContentType = response?.allHeaderFields["Content-Type"] as? String {
            if responseContentType.range(of: "application/json") != nil {
//                application/vnd.github.v3+json
                return true
            }
        }
        return false
    }
    

    /**
        This method is used to check if the responseStaus contains error
     
           - Parameter response: The actual HTTURLPResponse from server
           - Returns: if there is error response else retuns nil
    */
    static func containsValidResponseInStatus(responseStaus: HTTPURLResponse) -> ResponseStatus {
        
        if isAcceptedStatus(response: responseStaus) && isAcceptedContentTypeForData(response: responseStaus) {
            return .success
        }
        
        switch responseStaus.statusCode {
        case unauthorizedStatusCode, badRequestStatusCode:
            let error = GitHubUserError.clientError("User is not Authorized", "")
            return .error(error)
        case notFoundStatusCode:
            let error = GitHubUserError.clientError("Domain Not Found", "")
            return .error(error)
        case serviceTempNotAvailableStatusCode:
            let error = GitHubUserError.clientError("Temporarily Unavailable", "Please try again later")
            return .error(error)
        default:
            let error = GitHubUserError.clientError("Something Went Wrong", "Please try again later")
            return .error(error)
        }
        
    }

}
