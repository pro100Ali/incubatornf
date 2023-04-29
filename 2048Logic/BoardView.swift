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
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color.brown)
                .opacity(0.5)
            VStack {
                ForEach(0..<game.board.count, id: \.self) { i in
                    HStack {
                        ForEach(0..<game.board.count, id: \.self) { j in
                            CellView(value: game.board[i][j])
                        }
                    }
                }
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
