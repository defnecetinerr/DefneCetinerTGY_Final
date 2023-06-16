//
//  Reachability.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 7.06.2023.
//

import Foundation
import Alamofire

final class Reachability {
    class func isConnectedToNetwork() -> Bool {
        NetworkReachabilityManager()?.isReachable ?? false
    }
}
