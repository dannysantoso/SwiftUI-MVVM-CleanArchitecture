//
//  RemoteDataSource.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import Foundation
import Combine
import Alamofire

protocol RemoteDataSourceProtocol: class {
    
    func getGames() -> AnyPublisher<ResultResponse<[GameResponse]>, Error>
}

final class RemoteDataSource: NSObject {
    private override init() {}
    
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func getGames() -> AnyPublisher<ResultResponse<[GameResponse]>, Error> {
        return Future<ResultResponse<[GameResponse]>, Error> { completion in
            if let url = URL(string: Endpoints.Gets.games.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: ResultResponse<[GameResponse]>.self) { response in
                        switch response.result {
                        case .success(let results):
                            completion(.success(results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}
