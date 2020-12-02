//
//  GameMapepr.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import Foundation

final class GameMapper {
    
    static func mapGameResponsesToDomains(input gameResponse: [GameResponse]) -> [GameModel] {
        return gameResponse.map { result in
            return GameModel(
                id: result.id ?? 0,
                name: result.name ?? "",
                rating: result.rating ?? 0,
                background_image: result.background_image ?? "",
                released: result.background_image ?? "",
                isFavorite: false
            )
        }
    }
    
    static func mapGameResponsesToEntities(input gameResponse: [GameResponse]) -> [GameEntity] {
        return gameResponse.map { result in
            let newGame = GameEntity()
            newGame.id = result.id ?? 0
            newGame.name = result.name ?? ""
            newGame.rating = result.rating ?? 0
            newGame.background_image = result.background_image ?? ""
            newGame.released = result.released ?? ""
            newGame.isFavorite = false
            return newGame
        }
    }
    
    static func mapGameEntitiesToDomains(input gameEntity: [GameEntity]) -> [GameModel] {
        return gameEntity.map { result in
            return GameModel(
                id: result.id,
                name: result.name,
                rating: result.rating,
                background_image: result.background_image,
                released: result.released,
                isFavorite: result.isFavorite
            )
        }
    }
}
