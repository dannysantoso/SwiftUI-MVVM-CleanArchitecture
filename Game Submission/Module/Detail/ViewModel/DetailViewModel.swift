//
//  DetailViewModel.swift
//  Game Submission
//
//  Created by danny santoso on 02/12/20.
//

import Foundation
import SwiftUI
import Combine

class DetailViewModel: ObservableObject {

    private var cancellable = Set<AnyCancellable>()
    private let detailUseCase: DetailUseCase
    
    @Published var gameModel: GameModel
    
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
        gameModel = detailUseCase.getDetail()
    }
    
    func addFavorite(game: GameModel) {
        
        detailUseCase.addFavorite(game: game)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    print("success")
                case .failure:
                    print("fail")
                }
            }, receiveValue: { game in
                self.gameModel.isFavorite = !game.isFavorite
            }).store(in: &cancellable)
    }
    
}
