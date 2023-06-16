//
//  MockHomeRouter.swift
//  iTunesProjectTests
//
//  Created by Defne Çetiner on 15.06.2023.
//

import Foundation
@testable import iTunesProject
import iTunesAPI

final class MockHomeRouter: HomeRouterProtocol {
    
    var isInvokedNavigate = false
    var invokedNavigateCount = 0
    var invokedNavigateParameters: (route: HomeRoutes, Void)?
    
    func navigate(_ route: iTunesProject.HomeRoutes) {
        isInvokedNavigate = true
        invokedNavigateCount += 1
        invokedNavigateParameters = (route, ())
    }
}
