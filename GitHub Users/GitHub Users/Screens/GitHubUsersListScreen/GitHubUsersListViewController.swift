//
//  GitHubUsersListViewController.swift
//  GitHub Users
//
//  Created by Ramesh B on 22/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import UIKit

class GitHubUsersListViewController: UIViewController {

    /// Storyboard identifier to fetch the viewcontroller
    static let identifier = String(describing: GitHubUsersListViewController.self)
    
    // MARK:- Outlets
    @IBOutlet weak var gitHubUsersTableView: UITableView!
    
    // MARK:- Properties
    var gitHubUsersList: [GitHubUser] = [] {
        didSet {
            if !gitHubUsersList.isEmpty {
                gitHubUsersTableView?.reloadData()
            } else {
             
            }
        }
    }
    
    /// Loading indicator reference to show when system is fetching data
    var activityIndicator: UIActivityIndicatorView?
    
    /// Pull to refresh in order to fetch new data
    var refreshControl: UIRefreshControl?
    
    /// ViewModal property
    var gitHubUserViewModal: GitHubUsersListViewModal!
    
    var gitHubUserPageViewController: GitHubUserPageViewController!
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Basic Setup for the view
        setUpView()
        
        /// ViewModal Object with GitHubUsersListViewController confirming through initializer
        gitHubUserViewModal = GitHubUsersListViewModal(delegate: self)
        
        
        /// Getting the git hub user list to load in tableview
        gitHubUserViewModal.getGitHubUsersList()
        
        
        /// Adds activity indicator while fetching Git User list
        activityIndicator = self.showActivityIndicatory(uiView: self.view)
    }

}
extension GitHubUsersListViewController {
    
    private func setUpView() {
        /// Registering the custom cell to the table view
        self.gitHubUsersTableView?.register(UINib(nibName: GitHubUserTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: GitHubUserTableViewCell.identifier)
        
        // Automativally sets the cell height
        gitHubUsersTableView?.rowHeight = UITableView.automaticDimension
        gitHubUsersTableView?.estimatedRowHeight = 600
        
        /// Adding UIRefreshControl to the tableview
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        
        // this is the replacement of implementing: "collectionView.addSubview(refreshControl)"
        gitHubUsersTableView?.refreshControl = refreshControl
        
    }
    
    @objc func refreshTableView(refreshControl: UIRefreshControl) {
        /// Getting the charity list to load in tableview
        gitHubUserViewModal.getGitHubUsersList()
        
        /// Start animating on refreshing the table view
        activityIndicator?.startAnimating()
        
        // somewhere in your code you might need to call:
        refreshControl.endRefreshing()
    }
}

// MARK: Table View DataSource
extension GitHubUsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitHubUsersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GitHubUserTableViewCell.identifier, for: indexPath) as? GitHubUserTableViewCell
        gitHubUserViewModal.getImage(from: (gitHubUsersList[indexPath.row].profileImage!), { (imageData) in
                cell?.profileImageView?.image = UIImage(data: imageData)
        })
        cell?.congifureCell(userModel: gitHubUsersList[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

// MARK: Table View Delegate
extension GitHubUsersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        gitHubUserPageViewController = storyBoard.instantiateViewController(withIdentifier: GitHubUserPageViewController.identifier) as? GitHubUserPageViewController
        gitHubUserPageViewController?.htmlURL = gitHubUsersList[indexPath.row].gitHubHtmlUrl
        
        self.navigationController?.pushViewController(gitHubUserPageViewController, animated: true)
    }
}

// MARK: View modal Delegates
extension GitHubUsersListViewController: GitHubUsersListViewModalDelegate {
    func gitHubUserList(_ list: [GitHubUser]?) {
        if let usersList = list {
            self.gitHubUsersList = usersList
            activityIndicator?.stopAnimating()
        }
    }
    
    func networkConnectionError() {
        activityIndicator?.stopAnimating()
        self.alertView(NETWORK_CONNECTION_FAIL_TITLE, description: NETWORK_CONNECTION_FAIL_DESCRIPTION)
    }
    
    func gitHubUserError(_ title: String, description message: String) {
        activityIndicator?.stopAnimating()
        self.alertView(title, description: message)
    }
}
