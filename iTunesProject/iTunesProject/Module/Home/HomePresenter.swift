//
//  HomePresenter.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 7.06.2023.
//

import Foundation
import iTunesAPI

protocol HomePresenterProtocol: AnyObject {
    func viewDidLoad()
    func numberOfItem() -> Int
    func track(_ index: Int) -> Track?
    func didSelectRowAt(index: Int)
    func searchTrack(with keyword: String)
    func clearSearchResult()
    
}

final class HomePresenter {
    
    unowned var view: HomeViewControllerProtocol?
    let router: HomeRouterProtocol!
    let interactor: HomeInteractorProtocol
    
    
    private var track: [Track] = []
    
    init(
         view: HomeViewControllerProtocol,
         router: HomeRouterProtocol,
         interactor: HomeInteractorProtocol
    )
    {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension HomePresenter: HomePresenterProtocol {
    func searchTrack(with keyword: String) {
        view?.showLoadingView()
        interactor.fetchTrack(with: keyword)
    }
    
    func clearSearchResult() {
        track = []
        view?.reloadData()
    }
    
 
    func viewDidLoad() {
        view?.setupTableView()
       
    }
    
    func numberOfItem() -> Int {
        track.count
    }
    
    func track(_ index: Int) -> Track? {
        return track[safe: index]
    }
    
    func didSelectRowAt(index: Int) {
        guard let source = track(index) else { return }
        router.navigate(.detail(source: source))
    }

}

extension HomePresenter: HomeInteractorOutputProtkol {
    
    func fetchTrackOutput(_ result: TrackSourcesResult) {
        view?.hideLoadingView()
        
        switch result {
        case .success(let response):
            self.track = response
            view?.reloadData()
        case .failure(let error):
            view?.showError(error.localizedDescription)
        }
    }
    
    
}
