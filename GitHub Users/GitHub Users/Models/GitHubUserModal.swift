//
//  GitHubUser.swift
//  GitHub Users
//
//  Created by Ramesh B on 22/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import Foundation

/// Model hold Git hub user information
struct GitHubUser: Codable {
    
    /// Git Hub User Name
    var loginUserName: String?
    
    /// User ID
    var id: Int?
    
    /// User profile image
    var profileImage: String?
    
    /// Git URL
    var url: String?
    
    /// User git profile html url to load in web view
    var gitHubHtmlUrl: String?
    
    /// Type of the account holded by user
    var accountType: String?
    
    /// Represents the site_admin status
    var adminStatus: Bool?
    
    /// Enum case names in which the raw value of these cases has to be match with keys for decoding
    private enum CodingKeys: String, CodingKey {
        case loginUserName = "login"
        case id
        case profileImage = "avatar_url"
        case url
        case gitHubHtmlUrl = "html_url"
        case accountType = "type"
        case adminStatus = "site_admin"
    }
}

