//
//  MockHomeViewController.swift
//  iTunesProjectTests
//
//  Created by Defne Çetiner on 15.06.2023.
//

import Foundation
@testable import iTunesProject


final class MockHomeViewController: HomeViewControllerProtocol {
    
    var isInvokedShowLoading = false
    var invokedShowLoadingCount = 0
    
    func showLoadingView() {
        isInvokedShowLoading = true
        invokedShowLoadingCount += 1
    }
    
    var isInvokedHideLoading = false
    var invokedHideLoadingCount = 0
    
    func hideLoadingView() {
        isInvokedHideLoading = true
        invokedHideLoadingCount += 1
    }
    
    var isInvokedSetupTableView = false
    var invokedSetupTableViewCount = 0
    
    func setupTableView() {
        isInvokedSetupTableView = true
        invokedSetupTableViewCount += 1
    }
    
    var isInvokedReloadData = false
    var invokedReloadDataCount = 0
    
    func reloadData() {
        isInvokedReloadData = true
        invokedReloadDataCount += 1
    }
    
    var isInvokedError = false
    var invokedErrorCount = 0
    
    func showError(_ message: String) {
        isInvokedError = true
        invokedErrorCount += 1
    }
    
    private(set) var isInvokedShowNoResultsMessage = false
    
    func showNoResultsMessage() {
        isInvokedShowNoResultsMessage = true
    }
}
