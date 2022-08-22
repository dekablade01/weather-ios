//
//  WeatherUITests.swift
//  WeatherUITests
//
//  Created by Issarapong Poesua on 22/8/22.
//

import XCTest

class WeatherUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        // UI tests must launch the application that they test.
        app = .init()
        app.launchArguments = ["-ui-tests"]
        app.launch()

    }
    
    func testPlaceholderView() {
        XCTAssert(app.staticTexts["placeholder_text"].exists)
    }

    func testAddCity() {
        addCity("Moscow")
        XCTAssert(app.staticTexts["Moscow"].waitForExistence(timeout: 0.5))

        addCity("Phuket")
        XCTAssert(app.staticTexts["Phuket"].waitForExistence(timeout: 0.5))
    }
    
    func testSwitchingTempUnit() {
        var switchButton: XCUIElement { app.buttons["unit_switch_button"] }

        addCity("Moscow")

        XCTAssert(
            app
                .staticTexts
                .containing(NSPredicate(format: "label CONTAINS[c] '°C'"))
                .firstMatch
                .waitForExistence(timeout: 0.5)
        )
        XCTAssertEqual(switchButton.label, "Fahrenheit")
        
        switchButton.tap()
        
        sleep(1)
        XCTAssertEqual(switchButton.label, "Celsius")
        XCTAssert(
            app
                .staticTexts
                .containing(NSPredicate(format: "label CONTAINS[c] '°F'"))
                .firstMatch
                .exists
        )
        
        switchButton.tap()
        
        sleep(1)
        XCTAssert(
            app
                .staticTexts
                .containing(NSPredicate(format: "label CONTAINS[c] '°C'"))
                .firstMatch
                .exists
        )
        XCTAssertEqual(switchButton.label, "Fahrenheit")
    }
    
    func testViewingForecast() {
        let city = "Bangkok"
        addCity(city)
        view(city)
        
        XCTAssert(app.navigationBars[city].exists)
        XCTAssert(app.cells.firstMatch.exists)
    }
    
    private func view(_ city: String) {
        app.staticTexts[city].tap()
    }
    
    private func addCity(_ city: String) {
        app.buttons["search_button"].tap()
        app.textFields["city_text_field"].typeText(city)
        app.buttons["go_button"].tap()
    }
}




