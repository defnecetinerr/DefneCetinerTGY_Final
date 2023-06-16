//
//  TrackCell.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 8.06.2023.
//

import UIKit

protocol TrackCellProtocol: AnyObject {
    func setImage(_ image: UIImage)
    func setTrackTitle(_ text: String)
    func setCollection(_ text: String)
    func setArtist(_ text: String)
    func playButtonTapped()
    func updatePlayButtonImage(isPlaying: Bool)
    func stopPlayback()
}

final class TrackCell: UITableViewCell {
    
    @IBOutlet private weak var trackImage: UIImageView!
    @IBOutlet private weak var trackTitle: UILabel!
    @IBOutlet private weak var artistTitle: UILabel!
    @IBOutlet private weak var collectionTitle: UILabel!
    @IBOutlet private weak var playButton: UIButton!
    
    var cellPresenter: TrackCellPresenterProtocol! {
        didSet {
            cellPresenter.load()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.5) {
            self.transform = CGAffineTransform.identity
        }
        
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    }
    
    @objc internal func playButtonTapped() {
        cellPresenter.playButtonTapped()
    }
}

extension TrackCell: TrackCellProtocol {
    
    func stopPlayback() {
        cellPresenter?.stopPlayback()
    }
    
    func setImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.trackImage.image = image
        }
    }
    
    func setTrackTitle(_ text: String) {
        trackTitle.text = text
    }
    
    func setCollection(_ text: String) {
        collectionTitle.text = text
    }
    
    func setArtist(_ text: String) {
        artistTitle.text = text
    }
    
    func updatePlayButtonImage(isPlaying: Bool) {
        let buttonImage = isPlaying ? UIImage(systemName: "pause.circle") : UIImage(systemName: "play.circle")
        playButton.setImage(buttonImage, for: .normal)
    }
    
}
