//
//  QuestionOptions.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/9/22.
//

import SwiftUI

struct QuestionOptions: View {
    private var options: [QuizOption] = [QuizOption(), QuizOption(), QuizOption(), QuizOption()]
    
    private var gridItemLayout: [GridItem] = Array(repeating: .init(.flexible(), spacing: 0), count: 2)
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 10){
            ForEach((0...(self.options.count - 1)), id: \.self) { i in
                self.options[i]

            }
        }
    }
}

struct QuestionOptions_Previews: PreviewProvider {
    static var previews: some View {
        QuestionOptions()
    }
}
