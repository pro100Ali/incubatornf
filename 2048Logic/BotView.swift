//
//  BotView.swift
//  2048Logic
//
//  Created by Али  on 29.04.2023.
//

import SwiftUI

struct BotView: View {
    @StateObject var game = GameModel(board: Array(repeating: Array(repeating: 0, count: 4), count: 4), score: 0, bestScore: 0)
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()

                HStack {
                    Button {
                        withAnimation(.spring()) {
                            game.spawnNewTile()
                            game.startBot()
                        }
                        print(game.board[0][0])
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width:geo.size.width * 0.13,height: geo.size.height * 0.06)
                                .foregroundColor(Color.green)
                            Image(systemName: "play.fill")
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: 20, height: 20)
                            
                        }
                    }
                    Button {
                        game.stopBot()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width:geo.size.width * 0.13,height: geo.size.height * 0.06)
                                .foregroundColor(Color.red)
                            Image(systemName: "stop.fill")
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: 20, height: 20)
                            
                        }
                    }
                }
                
                BoardView()
                    .environmentObject(game)
                    .frame(height: geo.size.height * 0.65)
                Spacer()

            }

        }
        
        
    }
}

struct BotView_Previews: PreviewProvider {
    static var previews: some View {
        BotView()
    }
}
