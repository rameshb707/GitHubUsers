//
//  GitHubUserViewModalTests.swift
//  GitHub UsersTests
//
//  Created by Ramesh B on 23/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import XCTest
@testable import GitHub_Users

class GitHubUserViewModalTests: XCTestCase {

    var gitHubUsersListViewModal: GitHubUsersListViewModal?
    var list: [GitHubUser]?
    var gitHubUsersListExpectation: XCTestExpectation?
    
    override func setUp()  {
        super.setUp()
        gitHubUsersListViewModal = GitHubUsersListViewModal(delegate: self)
    }

    override func tearDown()  {
        super.tearDown()
        gitHubUsersListViewModal = nil
        gitHubUsersListExpectation = nil
        list = nil
    }

    func testGitHubUsersList() {
        gitHubUsersListExpectation = expectation(description: "GitHubUsers Expectation")
        gitHubUsersListViewModal?.getGitHubUsersList()
        waitForExpectations(timeout: 10)
    }
}


extension GitHubUserViewModalTests: GitHubUsersListViewModalDelegate {
    func gitHubUserList(_ list: [GitHubUser]?) {
        XCTAssertNotNil(list)
        XCTAssertFalse(list!.isEmpty)

        gitHubUsersListViewModal?.getImage(from: (list?.first?.profileImage)!, { (data) in
            XCTAssertNotNil(data)
            self.gitHubUsersListExpectation?.fulfill()
        })
    }
    
    func gitHubUserError(_ title: String, description message: String) {
        XCTFail()
        gitHubUsersListExpectation?.fulfill()
    }
    
    func networkConnectionError() {
        XCTFail()
        gitHubUsersListExpectation?.fulfill()
    }

}
