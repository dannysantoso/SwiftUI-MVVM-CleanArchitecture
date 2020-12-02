//
//  HomeViewModel.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    private let homeUseCase: HomeUseCase
    
    @Published private(set) var gameModel: [GameModel] = []
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
        
        homeUseCase.getGames()
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("success")
                case.failure(let error):
                    print(error)
                }
            } receiveValue: { games in
                self.gameModel = games
            }.store(in: &cancellable)
    }
        
    func linkBuilder<Content: View>(
        for game: GameModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: makeDetailView(for: game)) { content() }
    }
    
    func reloadData() {
        homeUseCase.getGames()
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("success")
                case.failure(let error):
                    print(error)
                }
            } receiveValue: { games in
                self.gameModel = games
            }.store(in: &cancellable)
    }
    
    func makeDetailView(for game: GameModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(game: game)
        let detailViewModel = DetailViewModel(detailUseCase: detailUseCase)
        return DetailView(detailViewModel: detailViewModel)
    }
}

