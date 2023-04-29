//
//  CustomButton.swift
//  2048Logic
//
//  Created by Али  on 29.04.2023.
//

import SwiftUI

class DirectionModel: ObservableObject {
    @Published var direction: Direction = .left
    init(direction: Direction) {
        self.direction = direction
    }
}



//struct CustomButton: View {
//    @EnvironmentObject var game: GameModel
//    var body: some View {
//        Button {
//            game.moveTiles(direction: )
//            print(game.board[0][0])
//        } label: {
//            Text("str")
//        }
//    }
//}

//struct CustomButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomButton(str: "")
//    }
//}
