//
//  GameModel.swift
//  2048Logic
//
//  Created by Али  on 29.04.2023.
//

import Foundation

class GameModel: ObservableObject {
    @Published var board: [[Int]]
    @Published var score: Int
    @Published var bestScore: Int
    init(board: [[Int]], score: Int, bestScore: Int) {
        self.board = board
        self.score = score
        self.bestScore = bestScore
    }
    func reset() {
        for i in 0..<4 {
            for j in 0..<4 {
                board[i][j] = 0
            }
        }
        spawnNewTile()
        //        generateRandomTile()
        score = 0
    }
    
    //    func runBot() {
    //        var count = 0
    //        let maxCount = 100
    //        let directions: [Direction] = [.left, .right, .up, .down]
    //
    //        while count < maxCount {
    //            let randomDirection = directions.randomElement()!
    //            let originalBoard = board
    //            moveTiles(direction: randomDirection)
    //
    //            if board != originalBoard {
    //                break
    //            }
    //            count += 1
    //        }
    //    }
    
    var botTimer: Timer?
    
    func startBot() {
        botTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.makeRandomMove()
        }
    }
    
    func stopBot() {
        botTimer?.invalidate()
        botTimer = nil
    }
    
    private func makeRandomMove() {
        let directions: [Direction] = [.left, .right, .up, .down]
        let randomDirection = directions.randomElement()!
        moveTiles(direction: randomDirection)
    }
    
    func moveTiles(direction: Direction) -> Bool {
        var moved = false
        var prevScore = score
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
                            prevScore+=board[i][k-1]
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
                            prevScore+=board[i][k+1]
                            
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
                            prevScore+=board[k-1][j]
                            
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
                            prevScore+=board[k+1][j]
                            
                            board[k][j] = 0
                            moved = true
                        }
                    }
                }
            }
        }
        
        score = prevScore
        if score > bestScore {
            bestScore = score
        }
        
        if moved {
            spawnNewTile()
        }
        
        if !hasValidMoves() {
            return false
        }
        return moved
    }
    
    func hasValidMoves() -> Bool {
        for i in 0..<4 {
            for j in 0..<4 {
                if board[i][j] == 0 {
                    return true
                }
                if i > 0 && board[i][j] == board[i-1][j] {
                    return true
                }
                if j > 0 && board[i][j] == board[i][j-1] {
                    return true
                }
            }
        }
        return false
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

