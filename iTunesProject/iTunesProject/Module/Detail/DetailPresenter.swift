//
//  DetailPresenter.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 7.06.2023.
//

import Foundation
import AVFoundation
import SDWebImage
import iTunesAPI


protocol DetailPresenterProtocol {
    func viewDidLoad()
    func playMusicTapped()
    func likeTapped()
    func removeFromFavoritesTapped()
    var source: Track? { get set }
}

final class DetailPresenter {
    unowned var view: DetailViewControllerProtocol!
    let router: DetailRouterProtocol
    var source: Track?
    
    private var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    private var currentTime: CMTime?
    private var isPlaying: Bool = false {
        didSet {
            if isPlaying {
                view.setPlayButtonImage(UIImage(named: "2")!)
            } else {
                view.setPlayButtonImage(UIImage(named: "1")!)
            }
        }
    }
    
    init(view: DetailViewControllerProtocol, router: DetailRouterProtocol) {
        self.view = view
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    
    func removeFromFavoritesTapped() {
        guard let track = source, let trackId = track.trackID else { return }
        
        CoreDataManager.shared.removeFromFavorites(trackId: trackId)
        view.setFavoriteState(false)
    }
    
    
    func playMusicTapped() {
        guard let track = source else { return }
        
        if isPlaying {
            pausePlayback()
        } else {
            startPlayback(with: track)
        }
    }

    private func startPlayback(with track: Track) {
        guard let previewURLString = track.previewURL,
              let previewURL = URL(string: previewURLString) else {
            return
        }
        
        if let player = player {
            player.pause()
            self.player = nil
        }
        
        let playerItem = AVPlayerItem(url: previewURL)
        player = AVPlayer(playerItem: playerItem)
        
        // Set the current time if available
        if let currentTime = currentTime {
            player?.seek(to: currentTime)
        }
        
        player?.play()
        
        isPlaying = true
    }

    private func pausePlayback() {
        player?.pause()
        currentTime = player?.currentTime()
        isPlaying = false
    }

    
    func likeTapped() {
        guard let track = source else { return }
        guard let trackId = track.trackID else { return }
        
        if CoreDataManager.shared.isFavorite(trackId: trackId) {
            CoreDataManager.shared.removeFromFavorites(trackId: trackId)
            view.setFavoriteState(false)
            view.showConfirmationAlert()
        } else {
            CoreDataManager.shared.addToFavorites(track: track)
            view.setFavoriteState(true)
        }
        
    }
    func viewDidLoad() {
        guard let track = source else { return }
        guard let trackId = track.trackID else { return }
        view.setFavoriteState(CoreDataManager.shared.isFavorite(trackId: trackId))
        
        if let imageUrlString = track.artworkUrl100,
           let imageUrl = URL(string: imageUrlString) {
            
            SDWebImageManager.shared.loadImage(
                with: imageUrl,
                options: .continueInBackground,
                progress: nil) { [weak self] image, _, error, _, _, _ in
                    guard let self = self else { return }
                    
                    if let error = error {
                        print("Image Load Error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let image = image else {
                        print("Failed to load image")
                        return
                    }
                    
                    self.view.setTrackImage(image)
                }
        }
        
        view?.setTrackName(track.trackName ?? "")
        view?.setTrackArtist(track.artistName ?? "")
        view?.setTrackCollection(track.collectionName ?? "")
        view?.setprimaryGenreName(track.primaryGenreName ?? "")
        view?.setTrackPrice(track.trackPrice ?? 0.0)
        view?.setCollectionPrice(track.collectionPrice ?? 0.0)
    }
    
    
    
}
