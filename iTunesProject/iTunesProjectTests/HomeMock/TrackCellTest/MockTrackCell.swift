//
//  MockTrackCell.swift
//  iTunesProjectTests
//
//  Created by Defne Çetiner on 15.06.2023.
//

import UIKit
@testable import iTunesProject


final class MockTrackCell: TrackCellProtocol {
 
    var isInvokedSetTrackImageView = false
    var invokedTrackImageViewCount = 0
    var invokedSetTrackImageViewParameters: (image: UIImage, Void)?
    
    func setImage(_ image: UIImage) {
        isInvokedSetTrackImageView = true
        invokedTrackImageViewCount += 1
        invokedSetTrackImageViewParameters = (image, ())
    }
    
    var isInvokedSetTitleLabel = false
    var invokedSetTitleLabelCount = 0
    var invokedSetTitleLabelParameters: (text: String, Void)?
    
    func setTrackTitle(_ text: String) {
        isInvokedSetTitleLabel = true
        invokedSetTitleLabelCount += 1
        invokedSetTitleLabelParameters = (text, ())
    }
    
    var isInvokedSetCollection = false
    var invokedSetCollectionCount = 0
    var invokedSetCollectionParameters: (text: String, Void)?
    
    func setCollection(_ text: String) {
        isInvokedSetCollection = true
        invokedSetCollectionCount += 1
        invokedSetCollectionParameters = (text, ())
    }
    
    var isInvokedSetArtist = false
    var invokedSetArtistCount = 0
    var invokedSetArtistParameters: (text: String, Void)?
    
    func setArtist(_ text: String) {
        isInvokedSetArtist = true
        invokedSetArtistCount += 1
        invokedSetArtistParameters = (text, ())
    }
    
    var isInvokedPlayButtonTapped = false
    var invokedPlayButtonTappedCount = 0
    
    func playButtonTapped() {
        isInvokedPlayButtonTapped = true
        invokedPlayButtonTappedCount += 1
    }
    
    var invokedUpdatePlayButtonImageParameters: (isPlaying: Bool, Void)?
    
    func updatePlayButtonImage(isPlaying: Bool) {
        invokedUpdatePlayButtonImageParameters = (isPlaying, ())
    }
    
}
