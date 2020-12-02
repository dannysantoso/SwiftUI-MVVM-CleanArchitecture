//
//  GameSubmissionRespository.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import Foundation
import Combine
import Network

protocol GameRepositoryProtocol {
    
    func getGames() -> AnyPublisher<[GameModel], Error>
    func addFavorite(game: GameModel) -> AnyPublisher<GameModel, Error>
}

final class GameRepository: NSObject {
    
    typealias GameInstance = (RemoteDataSource, LocaleDataSource) -> GameRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(remote: RemoteDataSource, locale: LocaleDataSource) {
        self.remote = remote
        self.locale = locale
    }
    
    static let sharedInstance: GameInstance = { remoteRepo, localeRepo in
        return GameRepository(remote: remoteRepo, locale: localeRepo)
    }
}

extension GameRepository: GameRepositoryProtocol {
    func getGames() -> AnyPublisher<[GameModel], Error> {
        
        return self.locale.getGames()
            .flatMap { result -> AnyPublisher<[GameModel], Error> in
                if result.isEmpty {
                    return self.remote.getGames()
                        .map { GameMapper.mapGameResponsesToEntities(input: $0.results) }
                        .flatMap { self.locale.addGames(from: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getGames()
                            .map { GameMapper.mapGameEntitiesToDomains(input: $0)}
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.locale.getGames()
                        .map { GameMapper.mapGameEntitiesToDomains(input: $0) }
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func addFavorite(game: GameModel) -> AnyPublisher<GameModel, Error> {
        
        return self.locale.addFavorite(games: game)
    }
}
