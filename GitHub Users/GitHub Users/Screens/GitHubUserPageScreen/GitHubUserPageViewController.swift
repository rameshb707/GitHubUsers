//
//  GitHubUserPageViewController.swift
//  GitHub Users
//
//  Created by Ramesh B on 23/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import UIKit
import WebKit

class GitHubUserPageViewController: UIViewController, WKNavigationDelegate {

    /// Storyboard identifier to fetch the viewcontroller
    static let identifier = String(describing: GitHubUserPageViewController.self)
    
    // MARK:- Outlets
    
    @IBOutlet weak var webload: WKWebView!
    
    // MARK: Properties
    var activityIndicator: UIActivityIndicatorView?
    var htmlURL: String?
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        webload.navigationDelegate = self
        
        /// Loads the html url in the
        if let url = htmlURL, let link = URL(string: url) {
            let request = URLRequest(url: link)
            webload.load(request)
        }
        
        /// Adds activity indicator while loading github page list
        activityIndicator = self.showActivityIndicatory(uiView: self.view)
        
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator?.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator?.stopAnimating()
    }
    
}
