//
//  Collection+Extensions.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 7.06.2023.
//

import Foundation

public extension Collection where Indices.Iterator.Element == Index {
  subscript (safe index: Index) -> Iterator.Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
