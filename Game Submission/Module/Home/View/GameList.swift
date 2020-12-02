//
//  GameList.swift
//  Game Submission
//
//  Created by danny santoso on 02/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameList: View {
    
    var homeViewModel: HomeViewModel
    var favoriteBool: Bool
    
    var body: some View {
        
        VStack(alignment: .center){
            ForEach(homeViewModel.gameModel.filter { $0.isFavorite == favoriteBool }) { game in
                homeViewModel.linkBuilder(for: game) {
                    HStack{
                        WebImage(url: URL(string: game.background_image))
                            .resizable()
                            .indicator(.activity)
                            .transition(.fade(duration: 0.5))
                            .frame(width: 100, height: 120)
                            .cornerRadius(15)
                        VStack(alignment: .leading) {
                            Text("+ \(String(game.rating))").font(.system(size: 16)).bold().foregroundColor(Color.blue)
                            Text(game.name).font(.system(size: 18)).bold().foregroundColor(Color.blue)
                            Text(game.released).font(.system(size: 12)).foregroundColor(Color.blue)
                        }
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width - 100, height: 150)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                }.buttonStyle(PlainButtonStyle())
            }
        }
        
    }
}
