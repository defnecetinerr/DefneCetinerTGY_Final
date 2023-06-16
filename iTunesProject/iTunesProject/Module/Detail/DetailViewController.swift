//
//  DetailViewController.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 10.06.2023.
//

import UIKit
import AVFoundation

protocol DetailViewControllerProtocol: AnyObject {
    func setTrackImage(_ image: UIImage)
    func setTrackName(_ text: String)
    func setTrackCollection(_ text: String)
    func setCollectionPrice(_ text: Double)
    func setTrackPrice(_ text: Double)
    func setTrackArtist(_ text: String)
    func setprimaryGenreName(_ text: String)
    func setPlayButtonImage(_ image: UIImage)
    func setFavoriteState(_ isFavorite: Bool)
    func showConfirmationAlert()
}

final class DetailViewController: BaseViewController {
    @IBOutlet private weak var trackImage: UIImageView!
    @IBOutlet private weak var trackName: UILabel!
    @IBOutlet private weak var artistName: UILabel!
    @IBOutlet private weak var trackCollection: UILabel!
    @IBOutlet private weak var trackGenreName: UILabel!
    @IBOutlet private weak var trackPrice: UILabel!
    @IBOutlet private weak var collectionPrice: UILabel!
    @IBOutlet private weak var playMusicButton: UIButton!
    @IBOutlet private weak var likeButton: UIButton!

    var presenter: DetailPresenterProtocol!

    private var audioPlayer: AVAudioPlayer?
       private var isPlaying: Bool = false {
           didSet {
               if isPlaying {
                   playMusicButton.setImage(UIImage(named: "2")!, for: .normal)
               } else {
                   playMusicButton.setImage(UIImage(named: "1")!, for: .normal)
               }
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        if presenter != nil {
              presenter.viewDidLoad()
          }
        setAccessibilityIdentifiers()
    }
    
    @IBAction private func playMusicTapped(_ sender: Any) {
        presenter.playMusicTapped()
    }
    
    @IBAction private func likeTapped(_ sender: Any) {
        presenter.likeTapped()
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    
    func showConfirmationAlert() {
        let alertController = UIAlertController(
            title: "Favorilerden Kaldır",
            message: "Bu şarkıyı favorilerinizden kaldırmak istediğinize emin misiniz?",
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(title: "Vazgeç", style: .cancel) { [weak self] (_) in
            if let track = self?.presenter.source {
                CoreDataManager.shared.addToFavorites(track: track)
            }
            self?.setFavoriteState(true)
            
        }
        
        let removeAction = UIAlertAction(title: "Kaldır", style: .destructive) { [weak self] (_) in
            self?.presenter.removeFromFavoritesTapped()
            self?.setFavoriteState(false)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(removeAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

  func setFavoriteState(_ isFavorite: Bool) {
      let imageName = isFavorite ? "heart.fill" : "heart"
      DispatchQueue.main.async {
          self.likeButton.setImage(UIImage(systemName: imageName), for: .normal)
      }
  }

    func setPlayButtonImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.playMusicButton.setImage(image, for: .normal)
        }
    }
    
    func setTrackImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.trackImage.image = image
        }
    }
    
    func setTrackName(_ text: String) {
        self.trackName.text = text
    }
    
    func setTrackCollection(_ text: String) {
        self.trackCollection.text = text
    }
    
    func setCollectionPrice(_ text: Double) {
        let priceString = "Collection Price: " + String(text)
        self.collectionPrice.text = priceString
    }
    
    func setTrackPrice(_ text: Double) {
        let priceString = "Track Price: " + String(text)
        self.trackPrice.text = priceString
    }
    
    func setTrackArtist(_ text: String) {
        self.artistName.text = text
    }
    
    func setprimaryGenreName(_ text: String) {
        self.trackGenreName.text = text
    }
   
}
extension DetailViewController {
    func setAccessibilityIdentifiers() {
        trackImage.accessibilityIdentifier = "trackImage"
        trackName.accessibilityIdentifier = "trackNameLabel"
        artistName.accessibilityIdentifier = "artistNameLabel"
        trackCollection.accessibilityIdentifier = "trackCollectionLabel"
        trackGenreName.accessibilityIdentifier = "trackGenreNameLabel"
        trackPrice.accessibilityIdentifier = "trackPriceLabel"
        collectionPrice.accessibilityIdentifier = "collectionPriceLabel"
        playMusicButton.accessibilityIdentifier = "playMusicButton"
        likeButton.accessibilityIdentifier = "likeButton"
    }
}
