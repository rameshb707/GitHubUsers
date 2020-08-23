//
//  GitHubUsersListViewModal.swift
//  GitHub Users
//
//  Created by Ramesh B on 22/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import Foundation

protocol GitHubUsersListViewModalDelegate: AnyObject {
    /**
     Calls when it fetchs the list successfully
     
      - Parameters:
        - list: List of GitHub User
     */
    func gitHubUserList(_ list: [GitHubUser]?)
    
    /**
      Calls when internet connection is failed
    */
    func networkConnectionError()
    
    /**
     Calls on error occured during performing to fetch GitHub User list
     
      - Parameters:
        - title: Error title
        - description: Error description
     */
    func gitHubUserError(_ title: String, description message: String)
}

class GitHubUsersListViewModal {
    
    /// Delegate
    weak var delegate: GitHubUsersListViewModalDelegate?
    
    /// Global property use to make network call
    private lazy var networkManager  = NetworkManager()
    
    /// Custom Initializer to confirm the delegate who is using the viewmodal to get neccessary infromation
    init(delegate: GitHubUsersListViewModalDelegate) {
        self.delegate = delegate
    }
    
    /**
     Fetches the Git hub user list form the endpoint by calling api from Network Manager.
     On Success it delgaates back to view to populate
    */
    func getGitHubUsersList() {
        if let reachable = NetworkReachability.sharedInstance?.isReachable, reachable {
            let request = Request(endPoint: GIT_HUB_USERS_END_POINT, parameters: nil, httpMethod: .GET)
            networkManager.send(modelType: [GitHubUser].self, request) {[weak self] (usersList, error) in
                DispatchQueue.main.async {
                    if let gitHubError = error {
                        self?.delegate?.gitHubUserError(gitHubError.title, description: gitHubError.description)
                    }
                    if let list = usersList {
                        self?.delegate?.gitHubUserList((list as? [GitHubUser]))
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.delegate?.networkConnectionError()
            }
        }
    }
    
    /**
     Fetches the Image data from the URL

     - Parameters:
        - url: Logo URL
        - completion: A callback that is called on the completion of API call
     */
     func getImage(from url: String,_ completion: @escaping (Data) -> Void){
         DispatchQueue.global(qos: .background).async {
             if let imageURL = URL(string: url) {
                 self.networkManager.getData(from: imageURL) { data, response, error in
                     guard let image = data, error == nil else {
                         return
                     }
                     DispatchQueue.main.async() {
                         completion(image)
                     }
                 }
             }
         }
     }
}
