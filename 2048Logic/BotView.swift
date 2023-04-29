//
//  BotView.swift
//  2048Logic
//
//  Created by Али  on 29.04.2023.
//

import SwiftUI

struct BotView: View {
    @StateObject var game = GameModel(board: Array(repeating: Array(repeating: 0, count: 4), count: 4), score: 0, bestScore: 0, gameOver: false, gameWon: false)
    
    @State private var showingAlert = true
    @State private var showingAlertWin = false

    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                HStack {
                    Button {
                        withAnimation(.spring()) {
                            game.randomNewTile()
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
                    Button {
                        withAnimation(.spring()) {
                            game.reset()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width:50,height: 40)
                                .foregroundColor(Color(uiColor: UIColor(red: 0.80, green: 0.76, blue: 0.71, alpha: 1.00)))
                            Image(systemName: "arrow.triangle.2.circlepath.circle")
                                .font(.system(size: 35))
                                .foregroundColor(Color.white)
                        }
                    }
                }
                
                BoardView()
                    .environmentObject(game)
                    .frame(height: geo.size.height * 0.65)
                Spacer()

            }

        }
        
        .onAppear {
            
            game.randomNewTile()
            
            if let savedBestScore = UserDefaults.standard.value(forKey: "bestScore") as? Int {
                game.bestScore = savedBestScore
            }
            if game.gameOver {
                showingAlert = true
            }
            if game.gameWon {
                showingAlertWin = true
            }
        }
            
                .alert(isPresented: $game.gameOver) {
                Alert(
                    title: Text("Ooops!"),
                    message: Text("You lost the game! Please tap the reset button"),
                    dismissButton: .default(Text("OK")) {
                    }
                )
            }
            .alert(isPresented: $game.gameWon) {
                Alert(
                    title: Text("Congratss!"),
                    message: Text("You won the game!"),
                    dismissButton: .default(Text("OK")) {
                    }
                )
            }
    }
    
    
       
}

struct BotView_Previews: PreviewProvider {
    static var previews: some View {
        BotView()
    }
}
