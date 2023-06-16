//
//  iTunesProjectUITests.swift
//  iTunesProjectUITests
//
//  Created by Defne Çetiner on 6.06.2023.
//

import XCTest

final class iTunesProjectUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("******** UITest ********")
    }
    
    func test_searchBar() throws {
        
        app.launch()
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.searchFields["Search Track"]/*[[".otherElements[\"searchBar\"].searchFields[\"Search Track\"]",".searchFields[\"Search Track\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let tKey = app/*@START_MENU_TOKEN@*/.keys["T"]/*[[".keyboards.keys[\"T\"]",".keys[\"T\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(tKey.exists)
        tKey.tap()
      
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(aKey.exists)
        aKey.tap()
     
        
        let rKey = app/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(rKey.exists)
        rKey.tap()
     
        
        let kKey = app/*@START_MENU_TOKEN@*/.keys["k"]/*[[".keyboards.keys[\"k\"]",".keys[\"k\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(kKey.exists)
        kKey.tap()
        XCTAssertTrue(aKey.exists)
        aKey.tap()
        let nKey =  app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(nKey.exists)
        nKey.tap()
    
    }
    
    func test_FavButton() throws {
        app.launch()
      
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.searchFields["Search Track"]/*[[".otherElements[\"searchBar\"].searchFields[\"Search Track\"]",".searchFields[\"Search Track\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let tKey = app/*@START_MENU_TOKEN@*/.keys["T"]/*[[".keyboards.keys[\"T\"]",".keys[\"T\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(tKey.exists)
        tKey.tap()
      
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(aKey.exists)
        aKey.tap()
     
        
        let rKey = app/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(rKey.exists)
        rKey.tap()
     
        
        let kKey = app/*@START_MENU_TOKEN@*/.keys["k"]/*[[".keyboards.keys[\"k\"]",".keys[\"k\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(kKey.exists)
        kKey.tap()
        XCTAssertTrue(aKey.exists)
        aKey.tap()
        let nKey =  app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(nKey.exists)
        nKey.tap()
        
        app.tables.staticTexts["Yolla"].tap()
                                        
      XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["likeButton"]/*[[".buttons[\"love\"]",".buttons[\"likeButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                        
    }
    
    func test_favDelete() throws {
        app.launch()
      
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.searchFields["Search Track"]/*[[".otherElements[\"searchBar\"].searchFields[\"Search Track\"]",".searchFields[\"Search Track\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let tKey = app/*@START_MENU_TOKEN@*/.keys["T"]/*[[".keyboards.keys[\"T\"]",".keys[\"T\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(tKey.exists)
        tKey.tap()
      
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(aKey.exists)
        aKey.tap()
     
        
        let rKey = app/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(rKey.exists)
        rKey.tap()
     
        
        let kKey = app/*@START_MENU_TOKEN@*/.keys["k"]/*[[".keyboards.keys[\"k\"]",".keys[\"k\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(kKey.exists)
        kKey.tap()
        XCTAssertTrue(aKey.exists)
        aKey.tap()
        let nKey =  app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(nKey.exists)
        nKey.tap()
        
        app.tables.staticTexts["Yolla"].tap()
                                        
      XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["likeButton"]/*[[".buttons[\"love\"]",".buttons[\"likeButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["likeButton"]/*[[".buttons[\"love\"]",".buttons[\"likeButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Favorilerden Kaldır"].scrollViews.otherElements.buttons["Kaldır"].tap()
                
    }

}



