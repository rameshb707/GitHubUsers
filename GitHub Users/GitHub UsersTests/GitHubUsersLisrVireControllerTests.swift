//
//  GitHubUsersLisrVireControllerTests.swift
//  GitHub UsersTests
//
//  Created by Ramesh B on 23/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import XCTest
@testable import GitHub_Users

class GitHubUsersLisrVireControllerTests: XCTestCase {

    var gitHubUsersListViewController: GitHubUsersListViewController!

    var gitHubUsersListViewModal: GitHubUsersListViewModal?
    var gitHubUsersExpectation: XCTestExpectation?
    var gitHubUsersInvalidExpectation: XCTestExpectation?

    override func setUp() {
        super.setUp()
        setUpViewController()
        gitHubUsersListViewModal = GitHubUsersListViewModal(delegate: self)

    }

    override func tearDown() {
        super.tearDown()
        gitHubUsersListViewModal = nil
    }
    
    private func setUpViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
         gitHubUsersListViewController = storyboard.instantiateViewController(withIdentifier: GitHubUsersListViewController.identifier) as? GitHubUsersListViewController
         gitHubUsersListViewController.viewDidLoad()
         let _ = gitHubUsersListViewController?.view
         gitHubUsersListViewController?.viewWillAppear(false)
     }

    func testNumberOfRows() {
         XCTAssertNotNil(gitHubUsersListViewController.gitHubUsersTableView)
         XCTAssertNotNil(gitHubUsersListViewController.gitHubUsersTableView.numberOfRows(inSection: 0) > 0)
     }
    
    func testPickUpSection() {
        gitHubUsersExpectation = expectation(description: "Expected to git user object")
        gitHubUsersListViewModal?.getGitHubUsersList()
        waitForExpectations(timeout: 30, handler: nil)
     }
}

extension GitHubUsersLisrVireControllerTests: GitHubUsersListViewModalDelegate {
    func gitHubUserList(_ list: [GitHubUser]?) {
            if let gitHubList = list {
               gitHubUsersListViewController.gitHubUsersList = gitHubList
               XCTAssertTrue(self.gitHubUsersListViewController?.gitHubUsersTableView.numberOfRows(inSection: 0) != 0)
               XCTAssertTrue(self.gitHubUsersListViewController?.gitHubUsersTableView.numberOfRows(inSection: 0) == gitHubList.count)
               gitHubUsersExpectation?.fulfill()
           } else {
               XCTFail()
               gitHubUsersExpectation?.fulfill()
           }
    }
    
    func gitHubUserError(_ title: String, description message: String) {
        XCTFail()
        gitHubUsersExpectation?.fulfill()
    }
    
    func networkConnectionError() {
        XCTFail()
        gitHubUsersExpectation?.fulfill()
    }

}
