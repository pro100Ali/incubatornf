//
//  ContentView.swift
//  2048Logic
//
//  Created by Али  on 29.04.2023.
//

import SwiftUI


enum Direction: String {
    case left = "left"
    case right = "right"
    case up = "up"
    case down = "down"
}


struct ContentView: View {
    @State private var chosenLevel: Levels = .easy
    
    @AppStorage("bestScore") private var bestScore = 0
    @StateObject var game = GameModel(board: Array(repeating: Array(repeating: 0, count: 4), count: 4), score: 0, bestScore: 0, gameOver: false, gameWon: false, level: Levels.easy)
    @State private var showingAlert = false
    @State private var showingAlertWin = false
    
    @State private var isGameOver = false
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    Text("The best score: \(game.bestScore)")
                        .bold()
                    Text("Score: \(game.score)")
                        .bold()
                }
                
                Spacer()
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
            }.padding()
            
            
            BoardView()
                .environmentObject(game)
            
            Spacer()
            VStack(spacing: 1) {
                Button {
                    withAnimation(.spring()) {
                        game.moveTiles(direction: Direction.up)
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width:90, height: 50)
                        
                        Image(systemName: "arrow.up")
                            .foregroundColor(Color.white)
                            .bold()
                        
                    }
                    
                }
                HStack {
                    Button {
                        withAnimation(.spring()) {
                            game.moveTiles(direction: Direction.left)
                            
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width:90, height: 50)
                            Image(systemName: "arrow.left")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                    Spacer()
                    Button {
                        withAnimation(.spring()) {
                            game.moveTiles(direction: Direction.right)
                            
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width:90, height: 50)
                            Image(systemName: "arrow.right")
                                .foregroundColor(Color.white)
                                .bold()
                            
                            
                        }
                    }
                }.padding()
                
                
                Button {
                    withAnimation(.spring()) {
                        game.moveTiles(direction: Direction.down)
                        
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width:90, height: 50)
                        Image(systemName: "arrow.down")
                            .foregroundColor(Color.white)
                            .bold()
                        
                    }
                }
                
                
            }.foregroundColor(Color(uiColor: UIColor(red: 0.80, green: 0.76, blue: 0.71, alpha: 1.00)))
            
            
            
        }
        .background(Color(uiColor: UIColor(red: 0.98, green: 0.97, blue: 0.94, alpha: 1.00)))
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
        
        .sheet(isPresented: $game.gameWon, content: {
            GameOverView()
                .environmentObject(game)
        })
        .onChange(of: game.gameOver) { gameOver in
            if gameOver {
                isGameOver = true
            }
        }
        .sheet(isPresented: $game.gameOver, content: {
            GameOverView()
                .environmentObject(game)
        })
        .onChange(of: game.gameOver) { gameOver in
            if gameOver {
                isGameOver = true
            }
        }
        
        
        
        
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


