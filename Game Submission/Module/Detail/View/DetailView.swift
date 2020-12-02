//
//  DetailView.swift
//  Game Submission
//
//  Created by danny santoso on 02/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    @ObservedObject var detailViewModel: DetailViewModel
    
    @State var isClick = false
    
    var body: some View {
        
        VStack {
            WebImage(url: URL(string: detailViewModel.gameModel.background_image))
                .resizable()
                .frame(height: 350)
            HStack {
                VStack(alignment: .leading) {
                    Text(detailViewModel.gameModel.name)
                        .bold()
                        .font(.system(size: 25))
                    Text("Date")
                }.padding()
                Spacer()
                Button(action: {
                    if isClick == true {
                        isClick = false
                        detailViewModel.addFavorite(game: detailViewModel.gameModel)
                        print(detailViewModel.gameModel.isFavorite)
                    } else {
                        isClick = true
                        detailViewModel.addFavorite(game: detailViewModel.gameModel)
                        print(detailViewModel.gameModel.isFavorite)
                    }
                }) {
                    VStack{
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(self.detailViewModel.gameModel.isFavorite == true ? .red : .gray)
                    }
                }
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
            Spacer()
        }
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
