//
//  Cat_ListUITests.swift
//  Cat ListUITests
//
//  Created by Javier Susa on 11/02/21.
//

import XCTest

class CatListUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testExample() throws {
        let searchTextField = app.textFields["Search ..."]
        XCTAssertEqual(searchTextField.label, "")

        searchTextField.tap()

        app.keys["A"].tap()

        app.keys["m"].tap()

        app.keys["e"].tap()

        app.keys["r"].tap()

        app.keys["i"].tap()

        app.keys["c"].tap()

        app.keys["a"].tap()

        app.keys["n"].tap()

        app.buttons["Return"].tap()
        app.tables.cells["American Curl, More..., chevron.right, United States, 3"].staticTexts["More..."].tap()

        let scrollViewsQuery = XCUIApplication().scrollViews
        let elementsQuery = scrollViewsQuery.otherElements

        let titleDescription = elementsQuery.staticTexts["DESCRIPTION"]
        XCTAssertEqual(titleDescription.label, "DESCRIPTION")

        let titleCountry = elementsQuery.staticTexts["COUNTRY"]
        XCTAssertEqual(titleCountry.label, "COUNTRY")

        let bodyCountry = elementsQuery.staticTexts["United States"]
        XCTAssertNotNil(bodyCountry)

        let titleIntelligence = elementsQuery.staticTexts["INTELLIGENCE"]
        XCTAssertEqual(titleIntelligence.label, "INTELLIGENCE")

        let bodyIntelligence = elementsQuery.staticTexts["3"]
        XCTAssertNotNil(bodyIntelligence)

        let titleAdaptability = elementsQuery.staticTexts["ADAPTABILITY"]
        XCTAssertEqual(titleAdaptability.label, "ADAPTABILITY")

        let bodyAdaptability = elementsQuery.staticTexts["5"]
        XCTAssertNotNil(bodyAdaptability)

        let titleLifeSpan = elementsQuery.staticTexts["LIFE SPAN"]
        XCTAssertEqual(titleLifeSpan.label, "LIFE SPAN")

        let bodyLifeSpan = elementsQuery.staticTexts["12 - 16"]
        XCTAssertNotNil(bodyLifeSpan)

        app.navigationBars["American Curl"].buttons["chevron.backward"].tap()
        searchTextField.tap()
        app.buttons["multiply.circle.fill"].tap()
        app.buttons["Cancel"].tap()


    }
}
