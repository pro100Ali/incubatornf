//
//  Limit.swift
//  2048Logic
//
//  Created by Али  on 30.04.2023.
//

import SwiftUI

enum Levels {
    case easy
    case medium
    case hard
}

struct Limit: View {
    @Binding var chosenLevel: Levels
    
    
    var body: some View {
        VStack {
            
            NavigationLink {
                
                ContentView()
            } label: {
                Text("Easy")
                
            }.onTapGesture {
                chosenLevel = .easy
            }
            
            
            NavigationLink {
                
                ContentView()
            } label: {
                Text("Medium")
                
            }.onTapGesture {
                chosenLevel = .medium
            }
            
            NavigationLink {
                
                ContentView()
            } label: {
                Text("Hard")
                
            }.onTapGesture {
                chosenLevel = .hard
            }
        }
        
        
        
    }
}

//struct Limit_Previews: PreviewProvider {
//    static var previews: some View {
//        Limit()
//    }
//}
