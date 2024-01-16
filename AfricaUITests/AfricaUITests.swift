//
//  AfricaUITests.swift
//  AfricaUITests
//
//  Created by Sergiy Vergun on 16/01/2024.
//

import XCTest

final class AfricaUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
            
        // Check if bottom bar tab buttons exist
        let watchTabButton = XCUIApplication().tabBars["Tab Bar"].buttons["Watch"]
        XCTAssertTrue(watchTabButton.exists)
        let browseTabButton = XCUIApplication().tabBars["Tab Bar"].buttons["Browse"]
        XCTAssertTrue(browseTabButton.exists)
        let mapTabButton = XCUIApplication().tabBars["Tab Bar"].buttons["Map"]
        XCTAssertTrue(mapTabButton.exists)
        let galleryTabButton = XCUIApplication().tabBars["Tab Bar"].buttons["Gallery"]
        XCTAssertTrue(galleryTabButton.exists)
        
        
        //Check if tab buttons working correctly
        browseTabButton.tap()
        XCTAssertTrue(app.navigationBars["Africa"].exists)
        
        watchTabButton.tap()
        XCTAssertTrue(app.navigationBars["Videos"].exists)
        
        mapTabButton.tap()
        XCTAssertTrue(app.staticTexts["Latitude:"].exists)
        XCTAssertTrue(app.staticTexts["Longitude:"].exists)
        
        
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
