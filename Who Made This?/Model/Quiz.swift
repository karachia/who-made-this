//
//  Quiz.swift
//  Who Made This?
//
//  Created by Sina Karachiani on 1/10/22.
//

import Foundation
import SwiftUI

struct Quiz: Hashable {
    var questions: [Question] = []
    var score: Int = 0
    
    func generateQuestions() {
        // find 5 composers, one for each question as the answer
        let indexOfComposersForQuestion = (0...4).map( {_ in Int.random(in: 0..<composers.count)} )
        var listOfAllQuestionsAndAnswers: [Int: [Int]] = [:]
        
        for idx in indexOfComposersForQuestion {
            listOfAllQuestionsAndAnswers[idx] = []
        }
        
        for idx in indexOfComposersForQuestion{
            // get a randomm work from this composer
            var indexOfMusicForComposer = Int.random(in: 0..<composers[idx].works.count)
            
            // if the music from this composer is already in the quiz, try to find another one
            while(listOfAllQuestionsAndAnswers[idx]!.contains(indexOfMusicForComposer)){
                indexOfMusicForComposer = Int.random(in: 0..<composers[idx].works.count)
            }
            listOfAllQuestionsAndAnswers[idx]!.append(indexOfMusicForComposer)
            
            
            
//            questions.append(Question(answer: composers[idx], music: indexOfMusicForComposer, otherOptions: ))
            
            
        }
                
    }
    
}
