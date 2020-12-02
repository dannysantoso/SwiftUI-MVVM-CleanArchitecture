//
//  Injection.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    func provideRepository() -> GameRepository {
        let realm = try? Realm()
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        
        return GameRepository.sharedInstance(remote, locale)
    }
    
    func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideDetail(game: GameModel) -> DetailUseCase {
      let repository = provideRepository()
      return DetailInteractor(repository: repository, game: game)
    }
    
}
