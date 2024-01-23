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
        
        // Test browse tab
        browseTabButton.tap()
        XCTAssertTrue(app.staticTexts["Lion"].exists)
        XCTAssertTrue(app.staticTexts["Zebra"].exists)
        XCTAssertTrue(app.staticTexts["Rhinoceros"].exists)
        app.swipeUp()
        XCTAssertTrue(app.staticTexts["Elephant"].exists)
        XCTAssertTrue(app.staticTexts["Cheetah"].exists)
        XCTAssertTrue(app.staticTexts["Giraffe"].exists)
        XCTAssertTrue(app.staticTexts["African buffalo"].exists)
        XCTAssertTrue(app.staticTexts["Hippopotamus"].exists)
        XCTAssertTrue(app.staticTexts["Wild dog"].exists)
        XCTAssertTrue(app.staticTexts["Meerkat"].exists)
        app.swipeUp()
        XCTAssertTrue(app.staticTexts["Ostrich"].exists)
        XCTAssertTrue(app.staticTexts["Gorilla"].exists)
        
        // Test grid button
        let switchViewButton = app.navigationBars["Africa"].buttons["gridButton"]
        XCTAssertTrue(switchViewButton.exists)
        switchViewButton.tap()
        XCTAssertFalse(app.staticTexts["Lion"].exists)
        
        // Test disable grid button
        let disableGridButton = app.navigationBars["Africa"].buttons["disableGridButton"]
        XCTAssertTrue(disableGridButton.exists)
        disableGridButton.tap()
        XCTAssertTrue(app.staticTexts["Lion"].exists)
        
        //Test animal tile on press navigation
        let animalTileText = app.staticTexts["Lion"]
        animalTileText.tap()
        XCTAssertTrue(app.navigationBars["More about lion"].exists)
        
    
        // Test watch tab
        watchTabButton.tap()
        
        // Test video tile on press navigation
        let animalVideoTileText = app.staticTexts["Cheetah"]
        animalVideoTileText.tap()
        let videoBackButton = app.navigationBars.buttons.element(boundBy: 0);
        XCTAssertTrue(videoBackButton.exists)
        videoBackButton.tap()
        
        // Test shuffle button
        let staticTextsBeforeShuffle = app.staticTexts
        let shuffleButton = app.navigationBars["Videos"].buttons["shuffleButton"]
        shuffleButton.tap()
        let staticTextsAfterShuffle = app.staticTexts
        XCTAssertFalse(staticTextsBeforeShuffle == staticTextsAfterShuffle)
        
        // Test map tab
        mapTabButton.tap()
        
        // Test pinching the map
        let staticTextsBeforePinch = app.staticTexts
        app.pinch(withScale: 2, velocity: 10)
        let staticTextsAfterPinch = app.staticTexts
        XCTAssertFalse(staticTextsBeforePinch==staticTextsAfterPinch)
        
        // Test gallery tab
        galleryTabButton.tap()
        let lionImage = app.images["lion"]
        XCTAssertTrue(lionImage.exists)
        
        
        

        
        
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
