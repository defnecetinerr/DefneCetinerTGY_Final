//
//  DetailInteractor.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 7.06.2023.
//




protocol DetailInteractorOutputProtocol {
    func fetchTrackDetailOutput(result: TrackSourcesResult)
}


final class DetailInteractor {
    var output: HomeInteractorOutputProtkol?
}
