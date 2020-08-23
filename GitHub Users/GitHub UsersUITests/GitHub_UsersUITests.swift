//
//  GitHub_UsersUITests.swift
//  GitHub UsersUITests
//
//  Created by Ramesh B on 22/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import XCTest

class GitHub_UsersUITests: XCTestCase {
    
    let application = XCUIApplication()

    override func setUp()  {
        super.setUp()
        continueAfterFailure = false
        application.launch()
    }
    
    override func tearDown()  {
        super.tearDown()
    }
    
    func testGitHubUsersList() throws {
        XCTAssertTrue(application.staticTexts["GitHub Users"].exists)
        
        let result = self.waitForResultWithExpectation(application.staticTexts["GitHub URL Identifier"], timeout: 5.0)
        switch result {
        case .completed:
            XCTAssertTrue(application.staticTexts["GitHub URL Identifier"].exists)
            XCTAssertTrue(application.staticTexts["LoginName Identifier"].exists)
        default:
            XCTFail()
        }
    }
    
    func testGitHubWebPage() {
        let result = self.waitForResultWithExpectation(application.staticTexts["GitHub URL Identifier"], timeout: 5.0)
        switch result {
        case .completed:
            application.tables.cells.containing(.staticText, identifier:"LoginName Identifier").children(matching: .other).element(boundBy: 0).tap()
            sleep(2)
            XCTAssertTrue(application.webViews.firstMatch.exists)
            application.navigationBars["GitHub_Users.GitHubUserPageView"].buttons["GitHub Users"].tap()
            XCTAssertTrue(application.staticTexts["LoginName Identifier"].exists)
        default:
            XCTFail()
        }
    }
}
