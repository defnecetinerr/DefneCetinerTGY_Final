//
//  File.swift
//  
//
//  Created by Defne Çetiner on 6.06.2023.
//

import Foundation

public struct TrackResult: Decodable {
   public let resultCount: Int?
   public let results: [Track]?
}

public struct Track: Decodable {
    public let wrapperType: String?
    public let kind: String?
    public let artistID, collectionID, trackID: Int?
    public let artistName: String?
    public let collectionName, trackName, collectionCensoredName, trackCensoredName: String?
    public let artistViewURL, collectionViewURL, trackViewURL: String?
    public let previewURL: String?
    public let artworkUrl30, artworkUrl60, artworkUrl100: String?
    public let collectionPrice, trackPrice: Double?
    public let releaseDate: String?
    public let collectionExplicitness: String?
    public let trackExplicitness: String?
    public let discCount, discNumber, trackCount, trackNumber: Int?
    public let trackTimeMillis: Int?
    public let country: String?
    public let currency: String?
    public let primaryGenreName: String?
    public let isStreamable: Bool?
    public let collectionArtistID: Int?
    public let collectionArtistName: String?
    public let collectionArtistViewURL: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable
        case collectionArtistID = "collectionArtistId"
        case collectionArtistName
        case collectionArtistViewURL = "collectionArtistViewUrl"
    }
}
