//
//  WelcomePage.swift
//  2048Logic
//
//  Created by Али  on 29.04.2023.
//

import SwiftUI

struct WelcomePage: View {
    
    @State private var firstViewIsOn = false
    @State private var secondViewIsOn = false
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                VStack {
                    Text("Welcome to the 2048!").fontWeight(.semibold).foregroundColor(.white).font(.custom("Helvetica", size: 54)).padding(.top, 160).multilineTextAlignment(.center)
                    Image("nf").resizable()
                        .frame(width: 150, height: 150)
                        .padding(.top, 50)
                    
                }
                
                Spacer()
                VStack(spacing: 10) {
                    NavigationLink(isActive: $firstViewIsOn) {
                        ContentView()
                    } label: {
                        Button {
                            firstViewIsOn.toggle()
                        } label: {
                            ZStack {
                                Rectangle().foregroundColor(Color(uiColor: UIColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1))).frame(height: 50).cornerRadius(8)
                                Text("Player").foregroundColor(Color.white).fontWeight(.semibold)
                            }
                        }
                    }
                    NavigationLink(isActive: $secondViewIsOn) {
                        BotView()
                    } label: {
                        Button {
                            secondViewIsOn.toggle()
                        } label: {
                            ZStack {
                                Rectangle().foregroundColor(Color(uiColor: UIColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1))).frame(height: 50).cornerRadius(8)
                                
                                Text("Bot").foregroundColor(Color.white).cornerRadius(8)
                                
                            }
                        }
                    }
                    
                    
                }.padding(.bottom, 40).padding()
                
            }.background(Color.black)
        }.ignoresSafeArea()
    }
}



struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
