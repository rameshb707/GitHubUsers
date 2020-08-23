//
//  GitHubUserError.swift
//  GitHub Users
//
//  Created by Ramesh B on 22/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import Foundation

/// Encapsulates all the network related errors
///
/// - ClientError: This encapsulates an error thrown by the client network operation
/// - UnsupportedStatus: This is returned when the status code from server is not valid
/// - CancelledOperation: This is returned with the network operation is cancelled
public enum GitHubUserError: Error {
    /// This encapsulates an error thrown by the client network operation
    case clientError(String, String)
    /// This is returned when an error occured during parsing
    case parseError(String)
    /// This is returned when an status code cannot be resolved.
    case undefiend
}

public extension GitHubUserError {
    
    /// Error title for the given error
    var title: String {
        switch self {
        case .clientError(let clientErrorTitle, _):
            return clientErrorTitle
        case .parseError(let parserErrotitle):
            return parserErrotitle
        case .undefiend:
            return ""
        }
    }
    
    /// The error description
    var description: String {
        switch self {
        case .clientError(_,let clientErrorDiscription):
            return clientErrorDiscription
        case .parseError(let parserErrotitle):
            return parserErrotitle
        case .undefiend:
            return ""
        }
    }
}
