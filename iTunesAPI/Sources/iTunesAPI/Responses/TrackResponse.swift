//
//  File.swift
//  
//
//  Created by Defne Çetiner on 7.06.2023.
//

import Foundation

public struct TrackResponse: Decodable {
    public let results: [Track]
    
    private enum RootCodingKeys: String, CodingKey {
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        self.results = try container.decode([Track].self, forKey: .results)
    }
}
