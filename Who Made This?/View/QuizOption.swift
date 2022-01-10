//
//  QuizOption.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/9/22.
//

import SwiftUI

struct QuizOption: View {
    
    @State private var isSelected: Bool = false
    @State private var color: Color = Color.white
    
    var optionID: Int
    var composer: Composer
    
    
    var body: some View {
        VStack{
            Button(action: {
                isSelected = !isSelected
                if isSelected{
                    color = Color.blue
                }
                else{
                    color = Color.white
                }
                
            }) {
                CircleImage(image: composer.image)
                    .frame(width: 110, height: 110)
            }
            
            Text(composer.lastName)
                .font(.caption)
        }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [color, Color.white]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(50)
           
        
    }
}

struct QuizOption_Previews: PreviewProvider {
    static var previews: some View {
        QuizOption(optionID: 0, composer: composers[3])
    }
}
