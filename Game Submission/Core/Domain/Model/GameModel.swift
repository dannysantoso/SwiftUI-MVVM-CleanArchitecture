//
//  GameModel.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import Foundation

struct GameModel: Equatable, Identifiable {
    
    let id: Int
    let name: String
    let rating: Double
    let background_image: String
    let released: String
    var isFavorite: Bool
}
