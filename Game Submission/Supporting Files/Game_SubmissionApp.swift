//
//  Game_SubmissionApp.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import SwiftUI

@main
struct Game_SubmissionApp: App {
    @StateObject var homeViewModel = HomeViewModel(homeUseCase: Injection().provideHome())
    
    var body: some Scene {
        WindowGroup {
            HomeView(homeViewModel: homeViewModel, favoriteBool: false)
//            ContentView()
        }
    }
}
