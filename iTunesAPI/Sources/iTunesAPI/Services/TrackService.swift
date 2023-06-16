//
//  File.swift
//  
//
//  Created by Defne Çetiner on 7.06.2023.
//

import Foundation
import Alamofire

public protocol TrackServiceProtocol: AnyObject {
    func fetchTrackData(word: String, completion: @escaping (Result<[Track], Error>) -> Void)
    func fetchImage(url: URL, completion: @escaping (Result<Data, Error>) -> Void)
    
}

public class TrackService: TrackServiceProtocol {
 
    public init() {}
    
    public func fetchImage(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func fetchTrackData(word: String, completion: @escaping (Result<[Track], Error>) -> Void) {
        let selectedTerm = word.replacingOccurrences(of: " ", with: "+")
                               .replacingOccurrences(of: "ı", with: "i")
                               .replacingOccurrences(of: "ö", with: "o")
                               .replacingOccurrences(of: "ü", with: "u")
                               .replacingOccurrences(of: "ş", with: "s")
                               .replacingOccurrences(of: "ç", with: "c")
                               .replacingOccurrences(of: "ğ", with: "g")
        
        let urlString = "https://itunes.apple.com/search?term=\(selectedTerm)&country=tr&entity=song&attribute=mixTerm"
        AF.request(urlString).responseData { response in
            switch response.result {
                
            case .success(let data):
                let decoder = Decoders.dateDecoder
                
                do{
                    let response = try decoder.decode(TrackResponse.self, from: data)
                    completion(.success(response.results))
                } catch {
                    print("JSON ERROR")
                }
            case .failure(let error):
                print("Hata Oluştu: \(error.localizedDescription)")
            }
        }
    }
}

