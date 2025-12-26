//
//  AddEditViewTest.swift
//  BookManager
//
//  Created by Ramone Hayes on 12/26/25.
//

import XCTest

class AddEditViewUITests: XCTestCase {
    
    @MainActor
    func testAddBookWorks() throws {
        let app = XCUIApplication()
        app.launch()
        
        let currentBookCount = app.collectionViews.firstMatch.cells.count
//        XCTAssertEqual(currentBookCount, 4)
        //Click the add Book button
        let addButton = app.buttons["Add Book"]
        addButton.tap()
        
        //Check Save Button is disabled
        let saveButton = app.buttons["Save Book"]
        XCTAssertFalse(saveButton.isEnabled)
        
        //Check on title field and write
        let titleField = app.textFields["Title of the book"]
        titleField.tap()
        titleField.typeText("New Book \(currentBookCount+1)")
        XCTAssertTrue(saveButton.isEnabled)
        
        //Click Save
        saveButton.tap()
        //check that book is added to the list
//        sleep(1)
        let afterBookCount = app.collectionViews.firstMatch.cells.count
        XCTAssertEqual(afterBookCount, currentBookCount+1)
        
    }
}
