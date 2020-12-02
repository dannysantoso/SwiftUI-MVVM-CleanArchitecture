//
//  DetailInteractor.swift
//  Game Submission
//
//  Created by danny santoso on 02/12/20.
//

import Foundation
import Combine


protocol DetailUseCase {
    
    func getDetail() -> GameModel
    func addFavorite(game: GameModel) -> AnyPublisher<GameModel, Error>
    
}

class DetailInteractor: DetailUseCase {
    
    private let repository: GameRepositoryProtocol
    private let game: GameModel
    
    required init(
        repository: GameRepositoryProtocol,
        game: GameModel
    ) {
        self.repository = repository
        self.game = game
    }
    
    func getDetail() -> GameModel {
        return game
    }
    
    func addFavorite(game: GameModel) -> AnyPublisher<GameModel, Error> {
        
        return repository.addFavorite(game: game)
    }
    
}
