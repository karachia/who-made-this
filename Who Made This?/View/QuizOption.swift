//
//  QuizOption.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/9/22.
//

import SwiftUI

struct QuizOption: View {
    
    @Binding var currentSelection: Int?
    @Binding var currentComposerSelection: Int?
    @Binding var showResult: Bool
    
    var optionID: Int
    var composer: Composer
    var answerComposerID: Int

//    func PrintInit() {
////        print("Option ID: \(self.optionID)  Composer: \(self.composer.lastName), answer: \(modelData.composers[answerComposerID].lastName)")
//    }
    
    func getColor() -> Color {
        var color: Color = Color.white
        if currentSelection == nil {
            return color
        }
        
        if self.showResult {
            //if this option is the answer turn green
            if self.composer.id == self.answerComposerID {
                color = Color.green
            }
            //else if this option is selected but is not the correct answer, turn red
            else if self.currentSelection == self.optionID && self.composer.id != self.answerComposerID {
                color = Color.red
            }
        }
        else {
            if currentSelection == self.optionID {
                color = Color.blue
            }
        }
        
        return color
    }
    
    
    var body: some View {
        VStack{
            Button(action: {
                // as long as the user has not submitted an answer, change the selection
                if !self.showResult {
                    self.currentSelection = self.optionID
                    self.currentComposerSelection = self.composer.id
                }
               
                
            }) {
                CircleImage(image: composer.image)
                    .frame(minWidth: 90, idealWidth: 125, maxWidth:150, minHeight: 90, idealHeight: 125, maxHeight: 150)
                    .padding(.top)
            }
            
            Text(composer.lastName)
                .font(.caption)
                .padding()
        }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [self.getColor(), Color.white]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(50)
           
        
    }
}

struct QuizOption_Previews: PreviewProvider {
    @State static var selection: Int? = 0
    @State static var composerSelection: Int? = 0
    @State static var showResult: Bool = false
    static var previews: some View {
        QuizOption(currentSelection: $selection, currentComposerSelection: $composerSelection, showResult: $showResult, optionID: 0, composer: composers[3], answerComposerID: 0)
    }
}
