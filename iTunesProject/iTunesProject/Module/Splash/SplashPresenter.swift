//
//  SplashPresenter.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 7.06.2023.
//

import Foundation

protocol SplashPresenterProtocol: AnyObject {
    func viewDidAppear()
}

final class SplashPresenter: SplashPresenterProtocol {
    
    unowned var view: SplashViewControllerProtocol!
    let router: SplashRouterProtocol!
    let interactor: SplashInteractorProtocol!
    
    init(
         view: SplashViewControllerProtocol,
         router: SplashRouterProtocol,
         interactor: SplashInteractorProtocol
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidAppear() {
        interactor.checkInternetConnection()
    }
}

extension SplashPresenter: SplashInteractorOutputProtocol {
    
    func internetConnection(status: Bool) {
        print(status)
        if status {
            self.router.navigate(.homeScreen)
          
        } else {
            view.noInternetConnection()
        }
    }
}
