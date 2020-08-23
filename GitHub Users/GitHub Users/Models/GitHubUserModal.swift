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
     
    /// This is the custom property which hold the favorite status of the each user. (Device specific)
    var isFavorite: Bool = false
    
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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        loginUserName = try values.decode(String.self, forKey: .loginUserName)
        id = try values.decode(Int.self, forKey: .id)
        profileImage = try values.decode(String.self, forKey: .profileImage)
        url = try values.decode(String.self, forKey: .url)
        gitHubHtmlUrl = try values.decode(String.self, forKey: .gitHubHtmlUrl)
        accountType = try values.decode(String.self, forKey: .accountType)
        adminStatus = try values.decode(Bool.self, forKey: .adminStatus)
        
        isFavorite = ODManager.sharedInstance.fetchFromUserDefaults(key: loginUserName ?? "")
    }
    
}

