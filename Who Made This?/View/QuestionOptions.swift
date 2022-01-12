//
//  QuestionOptions.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/9/22.
//

import SwiftUI

struct QuestionOptions: View {
    var options: [QuizOption]
    
    var gridItemLayout: [GridItem] = Array(repeating: .init(.flexible(), spacing: 0), count: 2)
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 10){
            ForEach((0..<self.options.count), id: \.self) { i in
                self.options[i]

            }
        }
    }
}

struct QuestionOptions_Previews: PreviewProvider {
    static var previews: some View {
        QuestionOptions(options: [QuizOption(optionID: 0, composer: composers[0]), QuizOption(optionID: 1, composer: composers[1]),
            QuizOption(optionID: 0, composer: composers[0]),
            QuizOption(optionID: 0, composer: composers[0])])
    }
}
