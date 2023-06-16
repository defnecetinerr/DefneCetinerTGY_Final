//
//  HomePresenterTest.swift
//  iTunesProjectTests
//
//  Created by Defne Çetiner on 15.06.2023.
//

import XCTest
@testable import iTunesProject
import iTunesAPI

final class HomePresenterTest: XCTestCase {
    
    var presenter: HomePresenter!
    var view: MockHomeViewController!
    var interactor: MockHomeInteractor!
    var router: MockHomeRouter!
    
    override func setUp() {
        super.setUp()
        
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(view: view, router: router, interactor: interactor)
    }
    override func tearDown() {
        view = nil
        interactor = nil
        router = nil
        presenter = nil
    }
    
    func test_viewDidLoad_InvokesRequiredViewMoethods() {
        
        XCTAssertFalse(view.isInvokedSetupTableView)
        XCTAssertEqual(view.invokedSetupTableViewCount, 0)
        XCTAssertNil(interactor.invokedSearcKey)
        XCTAssertEqual(interactor.inkovedFetchTrackCount, 0)
        
        let keyword = "tarkan"
        interactor.fetchTrack(with: keyword)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.isInvokedSetupTableView)
        XCTAssertEqual(view.invokedSetupTableViewCount, 1)
        XCTAssertEqual(interactor.invokedSearcKey?.keyword, keyword)
        XCTAssertEqual(interactor.inkovedFetchTrackCount, 1)
    }
    
    func testFetchTrackOutput() {
        XCTAssertFalse(view.isInvokedHideLoading)
        XCTAssertEqual(presenter.numberOfItem(), 0)
        XCTAssertFalse(view.isInvokedReloadData)
        
        presenter.fetchTrackOutput(.success(TrackResult.response.results!))
        
        XCTAssertTrue(view.isInvokedHideLoading)
        XCTAssertEqual(presenter.numberOfItem(), 50)
        XCTAssertTrue(view.isInvokedReloadData)
        
        presenter.fetchTrackOutput(.success([]))
        
        XCTAssertTrue(view.isInvokedHideLoading)
        XCTAssertEqual(presenter.numberOfItem(), 0)
        XCTAssertTrue(view.isInvokedReloadData)
    }
    
    func testSearchTrack_ShowsLoadingAndFetchesTrack() {
        
        let keyword = "Test"
        
        XCTAssertFalse(view.isInvokedShowLoading)
        XCTAssertEqual(view.invokedShowLoadingCount, 0)
        
        presenter.searchTrack(with: keyword)
        
        XCTAssertTrue(interactor.isInvokedFetchTrack)
        XCTAssertEqual(interactor.inkovedFetchTrackCount, 1)
    }
}

extension TrackResult {
    static var response: TrackResult {
        let bundle = Bundle(for: HomePresenterTest.self)
        let path = bundle.path(forResource: "Track", ofType: "json")!
        let file = try! String(contentsOfFile: path)
        let data = file.data(using: .utf8)!
        let response = try! JSONDecoder().decode(TrackResult.self, from: data)
        return response
    }
}

