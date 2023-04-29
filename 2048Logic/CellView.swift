//
//  CellView.swift
//  2048Logic
//
//  Created by Али  on 29.04.2023.
//

import SwiftUI

struct CellView: View {
    let value: Int
    
       var cellColor: Color {
           switch value {
           case 0:
               return Color(uiColor: UIColor(red: 0.80, green: 0.76, blue: 0.71, alpha: 1.00))
           case 2:
               return Color(uiColor: UIColor(red: 0.93, green: 0.89, blue: 0.86, alpha: 1.00))
               
           case 4:
               return Color(uiColor:UIColor(red: 0.92, green: 0.88, blue: 0.80, alpha: 1.00))
               
           case 8:
               return Color(uiColor:UIColor(red: 0.92, green: 0.88, blue: 0.80, alpha: 1.00))
               
           case 16:
               return Color(uiColor:UIColor(red: 0.91, green: 0.60, blue: 0.42, alpha: 1.00))
               
           case 32:
               return Color(uiColor:UIColor(red: 0.90, green: 0.51, blue: 0.40, alpha: 1.00))
               
           case 64:
               return Color(uiColor:UIColor(red: 0.89, green: 0.41, blue: 0.28, alpha: 1.00))
               
           case 128:
               return Color(uiColor:UIColor(red: 0.91, green: 0.82, blue: 0.50, alpha: 1.00))
               
           case 256:
               return Color(uiColor:UIColor(red: 0.91, green: 0.80, blue: 0.45, alpha: 1.00))

           case 512:
               return Color(uiColor:UIColor(red: 0.91, green: 0.79, blue: 0.40, alpha: 1.00))

           case 1024:
               return Color(uiColor:UIColor(red: 0.91, green: 0.78, blue: 0.35, alpha: 1.00))
               
           case 2048:
               return Color(uiColor:UIColor(red: 0.90, green: 0.77, blue: 0.31, alpha: 1.00))
               
           default:
               return Color.gray
           }
       }

       var body: some View {
           ZStack {
               RoundedRectangle(cornerRadius: 5)
                   .frame(width: 80, height: 80)
                   .foregroundColor(cellColor)
               if value != 0 {
                   Text("\(value)")
                       .bold()
                       .font(.system(size: 40))
                       .opacity(0.5)
               }
              
           }
       }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(value: 0)
    }
}
