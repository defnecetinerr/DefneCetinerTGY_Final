//
//  TrackCellPresenter.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 8.06.2023.
//

import iTunesAPI
import SDWebImage
import AVFoundation

protocol ImageFetcherProtocol {
    func fetchImage(url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

final class ImageFetcher: ImageFetcherProtocol {
    func fetchImage(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            } else {
                let error = NSError(domain: "ImageFetcher", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch image data"])
                completion(.failure(error))
            }
        }.resume()
    }
}

protocol TrackCellPresenterProtocol: AnyObject {
    var isPlaying: Bool { get }
    func load()
    func playButtonTapped()
    func stopPlayback()

}

final class TrackCellPresenter: TrackCellPresenterProtocol {
    
    func stopPlayback() {
        player?.pause()
        isPlaying = false
    }
    
    
    weak var view: TrackCellProtocol?
    private let track: Track
    private let imageFetcher: ImageFetcherProtocol
    public var player: AVPlayer?
    private static var activePresenter: TrackCellPresenter?
    private var currentTime: CMTime?
  
    
    internal var isPlaying: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.view?.updatePlayButtonImage(isPlaying: self.isPlaying)
            }
        }
    }
    
    init(view: TrackCellProtocol?, track: Track, imageFetcher: ImageFetcherProtocol) {
        self.view = view
        self.track = track
        self.imageFetcher = imageFetcher
    }
    
    func playButtonTapped() {
         if isPlaying {
             pausePlayback()
             TrackCellPresenter.activePresenter = nil
         } else {
             if let activePresenter = TrackCellPresenter.activePresenter {
                 activePresenter.pausePlayback()
             }
             
             startPlayback()
             TrackCellPresenter.activePresenter = self
         }
     }
    
    private func startPlayback() {
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
       
       func pausePlayback() {
           player?.pause()
           currentTime = player?.currentTime()
           isPlaying = false
       }
   
    func load() {
        view?.setArtist(track.artistName ?? "")
        view?.setTrackTitle(track.trackName ?? "")
        view?.setCollection(track.collectionName ?? "")
        
        if let imageUrl = track.artworkUrl100, let url = URL(string: imageUrl) {
            view?.setImage(UIImage())
            imageFetcher.fetchImage(url: url) { [weak self] result in
                switch result {
                case .success(let imageData):
                    DispatchQueue.main.async {
                        if let image = UIImage(data: imageData) {
                            self?.view?.setImage(image)
                        } else {
                            print("Invalid image data")
                        }
                    }
                case .failure(let error):
                    print("Image Fetch Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
