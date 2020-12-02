//
//  TabBar.swift
//  Game Submission
//
//  Created by danny santoso on 02/12/20.
//

import SwiftUI

struct TabBar : View {
    
    @State var index = 0
    
    var body: some View{
        
        HStack{
            Button(action: {
                self.index = 0
            }) {
                VStack{
                    Image(systemName: "square.grid.2x2.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 0 ? .blue : .gray)
                    if self.index == 0{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 8, height: 8)
                            .offset(y: 6)
                    }
                }
            }
            Spacer(minLength: 0)
            Button(action: {
                self.index = 1
            }) {
                VStack{
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 1 ? .blue : .gray)
                    
                    if self.index == 1{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 8, height: 8)
                            .offset(y: 6)
                    }
                }
            }
            Spacer(minLength: 0)
            Button(action: {
                self.index = 2
            }) {
                VStack{
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 2 ? .blue : .gray)
                    if self.index == 2{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 8, height: 8)
                            .offset(y: 6)
                    }
                }
            }
        }
        .padding(.horizontal, 35)
        .padding(.top, 12)
        .background(Color.white)
        .animation(.default)
    }
}


//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar()
//    }
//}
