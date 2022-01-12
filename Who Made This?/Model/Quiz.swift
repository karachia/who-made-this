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
    

    init () {
        // Generate 5 questions
        // find 5 composers, one for each question as the answer
        let indexOfComposersForQuestions = (0...4).map( {_ in Int.random(in: 0..<composers.count)} )
//        print("indexOfComposersForQuestions: \(indexOfComposersForQuestions)")
        
        var listOfAllQuestionsAndAnswers: [Int: [Int]] = [:]
        
        for idx in indexOfComposersForQuestions {
            listOfAllQuestionsAndAnswers[idx] = []
        }
        
//        print("listOfAllQuestionsAndAnswers: \(listOfAllQuestionsAndAnswers)")
        
        var counter = 0
        for idx in indexOfComposersForQuestions{
//            print("composer \(composers[idx].lastName)")
//            print("works # \(composers[idx].works.count)")
            
            // get a randomm work from this composer
            var indexOfMusicForComposer = Int.random(in: 0..<composers[idx].works.count)
            
            // if the music from this composer is already in the quiz, try to find another one
            while(listOfAllQuestionsAndAnswers[idx]!.contains(indexOfMusicForComposer)){
                indexOfMusicForComposer = Int.random(in: 0..<composers[idx].works.count)
            }
            listOfAllQuestionsAndAnswers[idx]!.append(indexOfMusicForComposer)
            
            
            var options:  [Composer] = []
            
            for _ in 0...2{
                var optionIdx = Int.random(in: 0..<composers.count)
                
                while (optionIdx == idx){
                    optionIdx = Int.random(in: 0..<composers.count)
                }
                
                options.append(composers[optionIdx])
            }
            
//            print("listOfAllQuestionsAndAnswers: \(listOfAllQuestionsAndAnswers)")
        
            self.questions.append(Question(id: counter, answer: composers[idx], workIndex: indexOfMusicForComposer, otherOptions: options, composersWorkNumber: indexOfMusicForComposer))
            counter += 1
        }
    }
}
