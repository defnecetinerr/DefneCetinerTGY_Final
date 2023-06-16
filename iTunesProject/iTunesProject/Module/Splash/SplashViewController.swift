//
//  SplashViewController.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 7.06.2023.
//

import UIKit

protocol SplashViewControllerProtocol: AnyObject {
    func noInternetConnection()
}

final class SplashViewController: BaseViewController {

    var presenter: SplashPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
      //  super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }

    
}

extension SplashViewController: SplashViewControllerProtocol {
    
    func noInternetConnection() {
        showAlertForInternet("Error", "No internet")
    }
    
}
