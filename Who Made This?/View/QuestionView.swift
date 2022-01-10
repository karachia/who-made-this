//
//  Question.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/9/22.
//

import SwiftUI

struct QuestionView: View {
    @State var iconName: String = "play.fill"
    var answer: Composer
    var otherOptions: [Composer]
    
    func generateAllOptions() -> [QuizOption]{
        var allOptions: [QuizOption] = []
        allOptions.append(QuizOption(optionID: 0, composer: self.answer))
        
        var i = 1
        for option in self.otherOptions{
            allOptions.append(QuizOption(optionID: i, composer: option))
            i += 1
        }
        return allOptions
    }
        
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("Who made this?")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
            Button(action: {
                
                self.iconName = "pause.fill"
            }) {
                Image(systemName: iconName)
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .clipShape(Circle())
                }
                    
            QuestionOptions(options: self.generateAllOptions()
            )
                            
            

            
     
            
            Spacer()
            
            HStack{

                Button(action: {
                    print("hi")
                }) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .italic()
                        .font(.title3)
                        .padding(10)
                        .frame(minWidth: 200, maxWidth: .infinity, minHeight: 30)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .padding(5)
                        .border(Color.black, width: 3)
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(answer: composers[0], otherOptions: [composers[1], composers[2], composers[3]])
.previewInterfaceOrientation(.portrait)
    }
}
