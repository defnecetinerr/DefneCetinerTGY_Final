//
//  HomeInteractor.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 7.06.2023.
//

import Foundation
import iTunesAPI

typealias TrackSourcesResult = Result<[Track], Error>

protocol HomeInteractorProtocol: AnyObject {
    func fetchTrack(with keyword: String)
}

protocol HomeInteractorOutputProtkol {
    func fetchTrackOutput(_ result: TrackSourcesResult)
}

fileprivate var trackService: TrackServiceProtocol = TrackService()

final class HomeInteractor {
    var output: HomeInteractorOutputProtkol?
}

extension HomeInteractor: HomeInteractorProtocol {
    
    func fetchTrack(with keyword: String) {
        trackService.fetchTrackData(word: keyword) { [weak self] result in
            guard let self else { return }
            self.output?.fetchTrackOutput(result)
        }
    }
}


