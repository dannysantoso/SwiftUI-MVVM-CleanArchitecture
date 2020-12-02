//
//  HomeInteractor.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import Foundation
import Combine

protocol HomeUseCase {
    
    func getGames() -> AnyPublisher<[GameModel], Error>
}

class HomeInteractor: HomeUseCase {
    private let repository: GameRepository
    
    required init(repository: GameRepository) {
        self.repository = repository
    }
    
    func getGames() -> AnyPublisher<[GameModel], Error> {
        return repository.getGames()
    }
}
