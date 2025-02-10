//
//  ImageDetailsViewUITests.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/8/25.
//

import XCTest
@testable import Assessment

final class ImageDetailsViewUITests: XCTestCase {
    
    var sut: ImageDetailsView!
    let app = XCUIApplication()
    
    override func setUp() {
        
        continueAfterFailure = true
        
        app.launch()
    }
    
    override func tearDown() {
        
    }
    
    func navigationToDetails() {
        let gridView = app.scrollViews["gridScrollView"]
        XCTAssertTrue(gridView.waitForExistence(timeout: 1), "❌ gridView did not appear in 1 second!")

        let firstCell = app.buttons.matching(identifier: "gridCell_0").firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 1), "❌ First cell did not appear in 1 second!")
                
        firstCell.tap()
    }
    
    func test_navigatingTo_success() {
        navigationToDetails()
        
        XCTAssertTrue(app.navigationBars["Image Details"].exists)
    }
    
    func test_backButton_exists() throws {
        
        navigationToDetails()
        
        XCTAssertTrue(app.buttons["chevron.left"].exists)
    }
    
    func test_loads_success() throws {
        guard let item = Developer.getItem() else { return }

        sut = ImageDetailsView(imageItem: item)

        XCTAssertNotNil(sut)
    }
    
    func test_image_exists() {
        navigationToDetails()
        
        XCTAssertTrue(app.images.firstMatch.exists)
    }
    
    func test_texts_exists() {
        navigationToDetails()
        
        let title = app.staticTexts.element(boundBy: 0)
        let description = app.staticTexts.element(boundBy: 1)
        
        let title2 = app.staticTexts["DSC_5017"]
        let authorText = app.staticTexts["authorLabel"]
        
        XCTAssertTrue(title.exists)
        XCTAssertTrue(title2.exists)
        XCTAssertTrue(description.exists)
        XCTAssertTrue(authorText.exists)
    }
    
    func test_dismiss_success() throws {
        
        navigationToDetails()
        
        app.buttons["chevron.left"].tap()
        
        XCTAssertTrue(app.navigationBars["Flickr Search"].exists)
    }
}
