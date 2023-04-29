//
//  BoardView.swift
//  2048Logic
//
//  Created by Али  on 29.04.2023.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var game: GameModel
    
    var body: some View {
        GeometryReader  { geo in
                  ZStack {
                      RoundedRectangle(cornerRadius: 5)
                          .foregroundColor(Color(uiColor: UIColor(red: 0.73, green: 0.68, blue: 0.64, alpha: 1.00)))
                          .opacity(0.5)
                          .padding([.bottom,.top], 23)
                          .padding()
                      VStack {
                          ForEach(0..<game.board.count, id: \.self) { i in
                              HStack {
                                  ForEach(0..<game.board.count, id: \.self) { j in
                                      CellView(value: game.board[i][j])
                                          .frame(width: 80, height: 80)
                                  }
                              }
                          }
                      }
                  }
        }
    }
}

//struct BoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardView()
//    }
//}
