//
//  GameModel.swift
//  2048Logic
//
//  Created by Али  on 29.04.2023.
//

import Foundation

class GameModel: ObservableObject {
    @Published var board: [[Int]]
    
    init(board: [[Int]]) {
        self.board = board
    }
    
    func moveTiles(direction: Direction) {
        var moved = false
        switch direction {
        case .left:
            for i in 0..<4 {
                for j in 0..<4 {
                    if j > 0 && board[i][j] != 0 {

                        var k = j
                        while k > 0 && board[i][k-1] == 0 {
                            board[i][k-1] = board[i][k]
                            board[i][k] = 0
                            k -= 1
                            moved = true
                        }

                        if k > 0 && board[i][k-1] == board[i][k] {
                            board[i][k-1] *= 2
                            board[i][k] = 0
                            moved = true
                        }
                    }
                }
            }

        case .right:
            for i in 0..<4 {
                for j in (0..<4).reversed() {
                    if j < 3 && board[i][j] != 0 {

                        var k = j
                        while k < 3 && board[i][k+1] == 0 {
                            board[i][k+1] = board[i][k]
                            board[i][k] = 0
                            k += 1
                            moved = true
                        }

                        if k < 3 && board[i][k+1] == board[i][k] {
                            board[i][k+1] *= 2
                            board[i][k] = 0
//                            score += board[i][k+1]
                            moved = true
                        }
                    }
                }
            }
        case .up:
            for j in 0..<4 {
                for i in 0..<4 {
                    if i > 0 && board[i][j] != 0 {

                        var k = i
                        while k > 0 && board[k-1][j] == 0 {
                            board[k-1][j] = board[k][j]
                            board[k][j] = 0
                            k -= 1
                            moved = true
                        }

                        if k > 0 && board[k-1][j] == board[k][j] {
                            board[k-1][j] *= 2
                            board[k][j] = 0
                            moved = true
                        }
                    }
                }
            }
            case .down:
              for j in 0..<4 {
                  for i in (0..<4).reversed() {
                      if i < 3 && board[i][j] != 0 {

                          var k = i
                          while k < 3 && board[k+1][j] == 0 {
                              board[k+1][j] = board[k][j]
                              board[k][j] = 0
                              k += 1
                              moved = true
                          }

                          if k < 3 && board[k+1][j] == board[k][j] {
                              board[k+1][j] *= 2
                              board[k][j] = 0
                              moved = true
                          }
                      }
                  }
              }
        }
        if moved {
            spawnNewTile()
        }
    }
    
    func spawnNewTile() {

        var emptyCells: [(Int, Int)] = []
        for i in 0..<4 {
            for j in 0..<4 {
                if board[i][j] == 0 {
                    emptyCells.append((i, j))
                }
            }
        }

        if let randomCell = emptyCells.randomElement() {
            let value = Int.random(in: 1...2) * 2
            board[randomCell.0][randomCell.1] = value
        }
    }
}

