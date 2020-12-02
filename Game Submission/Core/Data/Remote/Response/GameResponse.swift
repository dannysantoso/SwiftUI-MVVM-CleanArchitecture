//
//  GameResponse.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import Foundation

struct GameResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case rating
        case background_image
        case released
        
    }
    
    let id: Int?
    let name: String?
    let rating: Double?
    let background_image: String?
    let released: String?
}
