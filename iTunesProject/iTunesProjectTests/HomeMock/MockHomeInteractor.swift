//
//  MockHomeInteractor.swift
//  iTunesProjectTests
//
//  Created by Defne Çetiner on 15.06.2023.
//

import Foundation
@testable import iTunesProject

final class MockHomeInteractor: HomeInteractorProtocol {
    
    var isInvokedFetchTrack = false
    var inkovedFetchTrackCount = 0
    var invokedSearcKey: (keyword: String, Void)?
    
    func fetchTrack(with keyword: String) {
        isInvokedFetchTrack = true
        inkovedFetchTrackCount += 1
        invokedSearcKey = (keyword, ())
    }
}
