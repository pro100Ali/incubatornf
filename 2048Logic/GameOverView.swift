//
//  GameOverView.swift
//  2048Logic
//
//  Created by Али  on 30.04.2023.
//

import SwiftUI

struct GameOverView: View {
    @EnvironmentObject var game: GameModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            VStack {
                if game.gameOver {
                    Text("Opps You lost")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                }
                else if game.gameWon {
                    Text("Congrats You won")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                }
                
                Text("Your score: \(game.score)")
                    .font(.headline)
                    .padding()
                Button  {
                    game.reset()
                    self.presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Text("Reset Game")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(uiColor: UIColor(red: 0.80, green: 0.76, blue: 0.71, alpha: 1.00)))
                        .cornerRadius(10)
                }
                .foregroundColor(Color(uiColor: UIColor(red: 0.80, green: 0.76, blue: 0.71, alpha: 1.00)))
            }
        }
        
    }



struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
