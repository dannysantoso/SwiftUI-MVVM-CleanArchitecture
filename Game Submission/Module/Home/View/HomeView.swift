//
//  HomeView.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @ObservedObject private(set) var homeViewModel: HomeViewModel
    var favoriteBool: Bool
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical) {
                VStack(alignment: .center) {
                    HStack{
                        Text("i-Game").font(.system(size: 35)).bold().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }.padding(
                        EdgeInsets(
                            top: 70,
                            leading: 10,
                            bottom: 0,
                            trailing: 10)
                    )
                    HStack{
                        Text("Trending Games").font(.system(size: 22)).bold().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    .padding(
                        EdgeInsets(
                            top: 10,
                            leading: 10,
                            bottom: 0,
                            trailing: 10)
                    )
                    Spacer()
                    GameList(homeViewModel: homeViewModel, favoriteBool: favoriteBool).padding()
                }.padding(5)
            }.background(Color(red: 0.975, green: 0.975, blue: 0.975))
            .ignoresSafeArea(.all)
        }
        TabBar()
    
    }
}
