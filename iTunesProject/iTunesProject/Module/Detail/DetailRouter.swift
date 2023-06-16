//
//  DetailRouter.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 7.06.2023.
//

import Foundation
import iTunesAPI

protocol DetailRouterProtocol {
    func navigate(_ route: DetailRoutes)
}
enum DetailRoutes {
    case detail(source: Track?)
}

final class DetailRouter {
    
    weak var viewController: DetailViewController?
    static func createModule() -> DetailViewController {
        let view = DetailViewController()
        let router = DetailRouter()
        let presenter = DetailPresenter(view: view, router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
}

extension DetailRouter: DetailRouterProtocol {
    func navigate(_ route: DetailRoutes) {
        func navigate(_ route: DetailRoutes) {
            switch route {
            case .detail(let source):
                let detailVC = DetailViewController()
                detailVC.presenter.source = source
                viewController?.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
}



