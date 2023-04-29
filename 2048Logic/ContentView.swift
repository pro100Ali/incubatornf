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
    
    @AppStorage("bestScore") private var bestScore = 0
    @StateObject var game = GameModel(board: Array(repeating: Array(repeating: 0, count: 4), count: 4), score: 0, bestScore: 0)
    
    var body: some View {
        GeometryReader  { geo in
            VStack {
                Spacer()
                HStack {
                    VStack {
                        Text("The best score: \(bestScore)")
                            .bold()
                        Text("Score: \(game.score)")
                            .bold()
                    }
                    
                    Spacer()
                    Button {
                        withAnimation(.spring()) {
                            game.reset()
                            
                            //                            game.startBot()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width:geo.size.width * 0.11,height: geo.size.height * 0.06)
                                .foregroundColor(Color.yellow)
                            Image(systemName: "arrow.triangle.2.circlepath.circle")
                                .font(.system(size: 35))
                                .foregroundColor(Color.white)
                        }
                    }
                }.padding()
                
                //                Button {
                //                    withAnimation(.spring()) {
                //                        game.startBot()
                //                    }
                //                    print(game.board[0][0])
                //                } label: {
                //                    ZStack {
                //                        RoundedRectangle(cornerRadius: 5)
                //                            .frame(width:geo.size.width * 0.13,height: geo.size.height * 0.06)
                //                            .foregroundColor(Color.yellow)
                //                        Image(systemName: "person.3.sequence")
                //                            .foregroundColor(Color.white)
                //                    }
                //                }
                //                Button {
                //                    game.stopBot()
                //                } label: {
                //                    Text("Stop the bot")
                //                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                    
                        .foregroundColor(Color(uiColor: UIColor(red: 0.73, green: 0.68, blue: 0.64, alpha: 1.00)))
                        .opacity(0.5)
                        .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.46)
                    
                    VStack {
                        ForEach(0..<game.board.count, id: \.self) { i in
                            HStack {
                                ForEach(0..<game.board.count, id: \.self) { j in
                                    CellView(value: game.board[i][j])
                                        .frame(width: geo.size.width * 0.20, height: geo.size.height * 0.1)
                                }
                            }
                        }
                    }
                }
                Spacer()
                VStack(spacing: 1) {
                    Button {
                        withAnimation(.spring()) {
                            print(game.score)
                            game.moveTiles(direction: Direction.up)
                            bestScore = game.bestScore
                            
                        }
                        print(game.board[0][0])
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width:geo.size.width * 0.3, height: geo.size.height * 0.06)
                            
                            Image(systemName: "arrow.up")
                                .foregroundColor(Color.white)
                                .bold()
                            
                        }
                        
                    }
                    HStack {
                        Button {
                            withAnimation(.spring()) {
                                game.moveTiles(direction: Direction.left)
                                bestScore = game.bestScore
                                
                            }
                            print(game.board[0][0])
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width:geo.size.width * 0.3,height: geo.size.height * 0.06)
                                Image(systemName: "arrow.left")
                                    .foregroundColor(Color.white)
                                    .bold()
                                
                                
                            }
                        }
                        Spacer()
                        Button {
                            withAnimation(.spring()) {
                                game.moveTiles(direction: Direction.right)
                                bestScore = game.bestScore
                                
                            }
                            print(game.board[0][0])
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width:geo.size.width * 0.3,height: geo.size.height * 0.06)
                                Image(systemName: "arrow.right")
                                    .foregroundColor(Color.white)
                                    .bold()
                                
                                
                            }                        }
                    }.padding()
                    
                    
                    Button {
                        withAnimation(.spring()) {
                            game.moveTiles(direction: Direction.down)
                            bestScore = game.bestScore
                            
                        }
                        print(game.board[0][0])
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width:geo.size.width * 0.3,height: geo.size.height * 0.06)
                            Image(systemName: "arrow.down")
                                .foregroundColor(Color.white)
                                .bold()
                            
                        }
                    }
                    
                    
                }.foregroundColor(Color(uiColor: UIColor(red: 0.80, green: 0.76, blue: 0.71, alpha: 1.00)))
                
                
                
            }
            .background(Color(uiColor: UIColor(red: 0.98, green: 0.97, blue: 0.94, alpha: 1.00)))
            .onAppear {
                game.spawnNewTile()
                
                if let savedBestScore = UserDefaults.standard.value(forKey: "bestScore") as? Int {
                    game.bestScore = savedBestScore
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
