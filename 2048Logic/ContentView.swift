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
    //    var board: [[Int]] =
    @StateObject var game = GameModel(board: Array(repeating: Array(repeating: 0, count: 4), count: 4))
    
    var body: some View {
        GeometryReader  { geo in
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color(uiColor: UIColor(red: 0.73, green: 0.68, blue: 0.63, alpha: 1.00)))
                        .opacity(0.5)
                        
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
                
                Button {
                    withAnimation(.spring()) {
                        game.moveTiles(direction: Direction.left)
                    }
                    print(game.board[0][0])
                } label: {
                    Text("left")
                }
                
                Button {
                    withAnimation(.spring()) {
                        game.moveTiles(direction: Direction.right)
                    }
                    print(game.board[0][0])
                } label: {
                    Text("right")
                }
                
                Button {
                    withAnimation(.spring()) {
                        game.moveTiles(direction: Direction.down)
                    }
                    print(game.board[0][0])
                } label: {
                    Text("down")
                }
                Button {
                    withAnimation(.spring()) {
                        game.moveTiles(direction: Direction.up)
                    }
                    print(game.board[0][0])
                } label: {
                    Text("up")
                }
            }.onAppear {
                game.spawnNewTile()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
