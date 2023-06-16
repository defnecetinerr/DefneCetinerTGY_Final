//
//  HomeInteractorTest.swift
//  iTunesProjectTests
//
//  Created by Defne Çetiner on 15.06.2023.
//

import XCTest
@testable import iTunesProject
import iTunesAPI

final class HomeInteractorTest: XCTestCase {

    var interactor: MockHomeInteractor!

     override func setUp() {
         super.setUp()
         
         interactor = .init()
     }

     override func tearDown() {
         interactor = nil
         super.tearDown()
     }
       func test_fetchTrack() {
           XCTAssertFalse(interactor.isInvokedFetchTrack)
           XCTAssertFalse((interactor.inkovedFetchTrackCount != 0))
    
           let keyword = "music"
           interactor.fetchTrack(with: keyword)
           
           XCTAssertTrue(interactor.isInvokedFetchTrack)
           XCTAssertEqual(interactor.inkovedFetchTrackCount, 1)
       }
    
    func test_fetchTrack_MultipleCalls() {
        XCTAssertFalse(interactor.isInvokedFetchTrack)
        XCTAssertEqual(interactor.inkovedFetchTrackCount, 0)
        
        let keyword = "music"
        let numberOfCalls = 5
        
        for _ in 1...numberOfCalls {
            interactor.fetchTrack(with: keyword)
        }
        
        XCTAssertTrue(interactor.isInvokedFetchTrack)
        XCTAssertEqual(interactor.inkovedFetchTrackCount, numberOfCalls)
    }
    
   }
