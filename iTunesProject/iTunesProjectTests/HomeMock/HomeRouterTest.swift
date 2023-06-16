//
//  HomeRouterTest.swift
//  iTunesProjectTests
//
//  Created by Defne Çetiner on 15.06.2023.
//

import XCTest
@testable import iTunesProject
import iTunesAPI

final class HomeRouterTest: XCTestCase {
    
    var router: MockHomeRouter!
    
    override func setUp() {
        super.setUp()
        router = MockHomeRouter()
    }
    
    override func tearDown() {
        router = nil
        super.tearDown()
    }
    
    func testNavigateToDetail() {
        
        let router = MockHomeRouter()
        router.navigate(.detail(source: nil))
        
        XCTAssertTrue(router.isInvokedNavigate)
        XCTAssertEqual(router.invokedNavigateCount, 1)
        if case .detail = router.invokedNavigateParameters?.route {
            
        } else {
            XCTFail("Route is not detail")
        }
    }
    
}
