//
//  FactsUITests.swift
//  FactsUITests
//
//  Created by Nancy on 10/11/20.
//

import XCTest

class FactsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }


    func testExample() throws {
        // UI tests must launch the application that they test.

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        app.launch()
        
        // To check Navigation title
          XCTAssert(app.navigationBars["About Canada"].exists)
        
        // To show UTableView Cells
        XCUIApplication().tables.element.swipeUp()
        let count = XCUIApplication().tables.element.children(matching: .cell).count
        XCTAssert(count > 0)

        
    }
}
